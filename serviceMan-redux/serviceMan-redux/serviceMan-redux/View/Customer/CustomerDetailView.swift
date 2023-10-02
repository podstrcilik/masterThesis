//
//  CustomerDetailView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 21.04.2023.
//

import SwiftUI
import MapKit

struct CustomerDetailView: View {
    @EnvironmentObject var store: Store<AppState>
    var state: CustomerDetailState? { store.state.screenState(for: .customer(id: customerId)) }
    let customerId: String

    var body: some View {
        VStack(alignment: .leading) {
            if let state, let customer = state.customer {
                Text(customer.name)
                    .font(.title)
                Text(customer.address)
                    .foregroundColor(.darkRed)
                ButtonInsideButtonView(title: customer.contactName, iconString: "phone.fill", function: { })
                @State var region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: customer.latitude,
                                                   longitude: customer.longitude),
                    latitudinalMeters: 750,
                    longitudinalMeters: 750
                )

                MapWrapper(coordinateRegion: $region)
                    .frame(height: 200)
                    .cornerRadius(10.0)
                    .onTapGesture {
                        store.dispatch(CustomerDetailAction.openAppleMaps(customer))
                        coordinatesMiddleware.openAppleMaps(region: region, name: customer.name)
                    }
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Zákazník")
        .onAppear(perform: {
            store.dispatch(ActiveScreensStateAction.showScreen(.customer(id: customerId)))
            store.dispatch(CustomerDetailAction.getCustomer(id: customerId))
        })
        .onDisappear(perform: {
            store.dispatch(ActiveScreensStateAction.dismissScreen(.customer(id: customerId)))
        })
        .preferredColorScheme(.dark)
    }
}

struct CustomerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerDetailView(customerId: "1")
    }
}
