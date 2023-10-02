//
//  ServiceEventCompletionState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 04.05.2023.
//

import Foundation

struct ServiceEventCompletionState {
    let id: String
    var completion: ServiceEventCompletion?
    var isLoading: Bool
}

extension ServiceEventCompletionState {
    init(id: String) {
        self.id = id
        completion = ServiceEventCompletion(id: "", serviceEventId: "", isCompleted: false, note: "Poznámka...", selectedItemCompletionType: .repaired, selectedImage: [])
        isLoading = false
    }
}
