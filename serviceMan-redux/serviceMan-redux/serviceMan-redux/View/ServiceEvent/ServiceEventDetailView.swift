////
////  ServiceEventDetailView.swift
////  serviceMan-mvvm
////
////  Created by Pavel Odstrčilík on 20.04.2023.
////
//
import SwiftUI
import MapKit

struct ServiceEventDetailView: View {
    @State private var showCustomerDetail = false

    @EnvironmentObject var store: Store<AppState>
    var state: ServiceEventDetailState? { store.state.screenState(for: .serviceEvent(id: eventId)) }
    var stateCommpletion: ServiceEventCompletionState? { store.state.screenState(for: .serviceEventCompletion(id: eventId)) }
    let eventId: String

    var body: some View {
        VStack(alignment: .leading) {
            if let state, let serviceEvent = state.serviceEvent {
                Group {
                    Text(serviceEvent.name)
                        .font(.title)
                        .bold()
                    Text(serviceEvent.address)
                        .foregroundColor(.darkRed)
                    Spacer()
                        .frame(height: 10.0)
                    Text(serviceEvent.date, style: .date)
                        .foregroundColor(.gray)
                }
                Spacer()
                    .frame(height: 10.0)
                TextWithBackground(title: "Popis", text: serviceEvent.description)

                ButtonInsideButtonView(title: serviceEvent.customer.contactName, iconString: "phone.fill", function: {                store.dispatch(ServiceEventDetailAction.callToNumber(serviceEvent))
                    phoneMiddleware.callToNumber(serviceEvent.telephoneContact)
                })
                NavigationLink(destination: CustomerDetailView(customerId: serviceEvent.customer.id)) {
                    TextWithArrow(title: serviceEvent.customer.name)
                        .foregroundColor(.white)
                }

                @State var region =  MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: serviceEvent.latitude,
                                                   longitude: serviceEvent.longitude),
                    latitudinalMeters: 750,
                    longitudinalMeters: 750
                )

                MapWrapper(coordinateRegion: $region)
                    .frame(height: 200)
                    .cornerRadius(10.0)
                    .onTapGesture {
                        store.dispatch(ServiceEventDetailAction.openAppleMaps(serviceEvent))
                        coordinatesMiddleware.openAppleMaps(region: region, name: serviceEvent.name)
                    }
                Spacer()
                Button(action:
                        {
                    store.dispatch(ActiveScreensStateAction.showScreen(.serviceEventCompletion(id: serviceEvent.id)))

                })
                {
                    Text("Hlášení stavu")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                }
                .buttonStyle(ConfirmButtonStyle()).padding(-15)
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Událost")
        .preferredColorScheme(.dark)
        .onAppear( perform: {
            store.dispatch(ServiceEventDetailAction.getServiceEvent(id: eventId))
        })
        .sheet(isPresented: Binding(get: {
            stateCommpletion != nil
        }, set: {
            _ in
        })) {
            if let serviceEvent = state?.serviceEvent {
                NavigationView {
                    ServiceEventCompletionView(eventId: serviceEvent.id)
                        .navigationTitle("Hlášení stavu")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Zavřít") {
                                    store.dispatch(ActiveScreensStateAction.dismissScreen(.serviceEventCompletion(id: serviceEvent.id)))
                                }
                            }
                        }
                }
            }
        }
        .padding()
        .onAppear(perform: {
            store.dispatch(ActiveScreensStateAction.showScreen(.serviceEvent(id: eventId)))
        })
        .onDisappear(perform: {
            store.dispatch(ActiveScreensStateAction.dismissScreen(.serviceEvent(id: eventId)))
        })
    }
}

struct ServiceEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceEventDetailView(eventId: "")
    }
}
