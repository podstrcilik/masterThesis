//
//  ServiceEventListViewModel.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

final class ServiceEventListViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var events: [ServiceEvent] = []

    func fetchData() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.events = ServiceEvent.sampleData
            self.isLoading = false
        }
    }
}

