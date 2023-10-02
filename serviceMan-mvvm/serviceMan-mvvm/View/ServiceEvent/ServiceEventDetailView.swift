//
//  ServiceEventDetailView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 20.04.2023.
//

import SwiftUI
import MapKit

struct ServiceEventDetailView: View {
    @ObservedObject private var viewModel: ServiceEventDetailViewModel

    init(serviceEvent: ServiceEvent) {
        viewModel = ServiceEventDetailViewModel(serviceEvent: serviceEvent)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text(viewModel.serviceEvent.name)
                    .font(.title)
                    .bold()
                Text(viewModel.serviceEvent.address)
                    .foregroundColor(.darkRed)
                Spacer()
                    .frame(height: 10.0)
                Text(viewModel.serviceEvent.date, style: .date)
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 10.0)
            TextWithBackground(title: "Popis", text: viewModel.serviceEvent.description)

            ButtonInsideButtonView(title: viewModel.serviceEvent.customer.contactName, iconString: "phone.fill", function: { viewModel.callNumber() })
            NavigationLink(destination: CustomerDetailView(customer: viewModel.serviceEvent.customer)) {
                TextWithArrow(title: viewModel.serviceEvent.customer.name)
                    .foregroundColor(.white)
            }

            MapWrapper(coordinateRegion: $viewModel.region)
                .frame(height: 200)
                .cornerRadius(10.0)
                .onTapGesture {
                    viewModel.openAppleMaps()
                }
            Spacer()
            Button(action:
                   { viewModel.isCompletionViewPresenting.toggle() }
            ) {
                Text("Hlášení stavu")
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .buttonStyle(ConfirmButtonStyle()).padding(-15)

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
            viewModel.getCoordinatesFromPlace()
        })
        .sheet(isPresented: $viewModel.isCompletionViewPresenting) {
            NavigationView {
                ServiceEventCompletionView(serviceEventId: viewModel.serviceEvent.id, isCompletionViewPresenting: $viewModel.isCompletionViewPresenting)
                    .navigationTitle("Hlášení stavu")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Zavřít") {
                                viewModel.isCompletionViewPresenting.toggle()
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

struct ServiceEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceEventDetailView(serviceEvent: ServiceEvent.sampleData[0])
    }
}
