//
//  CustomerDetailView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 21.04.2023.
//

import SwiftUI

struct CustomerDetailView: View {
    @ObservedObject var viewModel: CustomerDetailViewModel

    init(customer: Customer) {
        self.viewModel = CustomerDetailViewModel(customer: customer)
    }

    var body: some View {
        VStack(alignment: .leading) {            
            Text(viewModel.customer.name)
                .font(.title)
            Text(viewModel.customer.address)
                .foregroundColor(.darkRed)
            ButtonInsideButtonView(title: viewModel.customer.contactName, iconString: "phone.fill", function: { })
            MapWrapper(coordinateRegion: $viewModel.region)
                .frame(height: 200)
                .cornerRadius(10.0)
                .onTapGesture {
                    viewModel.openAppleMaps()
                }
            Spacer()

        }
        .padding()
        .navigationTitle("Zákazník")
        .onAppear(perform: { viewModel.getCoordinatesFromPlace() })
            .preferredColorScheme(.dark)
    }
}

struct CustomerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerDetailView(customer: Customer.sampleData)
    }
}
