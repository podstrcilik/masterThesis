//
//  ServiceEventDetailViewModel.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 20.04.2023.
//

import SwiftUI
import MapKit

final class ServiceEventDetailViewModel: ObservableObject, PhoneProtocol, CoordinatesProtocol {
    @Published var serviceEvent: ServiceEvent
    @Published var region = MKCoordinateRegion()
    @Published var isCompletionViewPresenting = false

    init(serviceEvent: ServiceEvent) {
        self.serviceEvent = serviceEvent
    }

    func openAppleMaps() {
        openAppleMaps(region: region, name: serviceEvent.name)
    }

    func callNumber() {
        callToNumber(serviceEvent.telephoneContact)
    }

    func getCoordinatesFromPlace() {
        getCoordinatesFromAddress(serviceEvent.address, completion: { (region) in
            guard let region else {
                return
            }
            self.region = region
        })
    }
}

