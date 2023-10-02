//
//  CustomerDetailViewModel.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 22.04.2023.
//

import SwiftUI
import MapKit

final class CustomerDetailViewModel: ObservableObject, PhoneProtocol, CoordinatesProtocol {
    @Published var customer: Customer
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()

    init(customer: Customer) {
        self.customer = customer
    }

    func callNumber() {
        callToNumber(customer.telephoneContact)
    }

    func getCoordinatesFromPlace() {
        getCoordinatesFromAddress(customer.address, completion: { (region) in
            guard let region else {
                return
            }
            self.region = region
        })
    }

    func openAppleMaps() {
        openAppleMaps(region: region, name: customer.name   )
    }
}

