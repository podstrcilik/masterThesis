//
//  ServiceEventDetailState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation
import MapKit

struct ServiceEventDetailState {
    let id: String
    let serviceEvent: ServiceEvent?
}

extension ServiceEventDetailState {
    init(id: String) {
        self.id = id
        serviceEvent = nil
    }
}
