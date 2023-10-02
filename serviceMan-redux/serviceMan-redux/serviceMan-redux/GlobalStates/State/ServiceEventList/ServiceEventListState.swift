//
//  ServiceEventListState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

struct ServiceEventListState {
    let serviceEvents: [ServiceEvent]
    let isLoading: Bool
}

extension ServiceEventListState {
    init() {
        serviceEvents = []
        isLoading = true
    }
}
