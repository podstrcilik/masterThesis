//
//  ServiceEventCompletionViewModel.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 22.04.2023.
//

import SwiftUI

final class ServiceEventCompletionViewModel: ObservableObject {
    @Published var serviceEventCompletion: ServiceEventCompletion
    @Published var selectedImage: [UIImage] = []
    @Published var selectedItemCompletionType = ServiceEventCompletionTypeEnum.repaired
    @Published var fullText: String = "Poznámka..."
    @Published var isLoading = false
    var isCompletionViewPresenting: Binding<Bool>

    init(serviceEventCompletion: ServiceEventCompletion, isCompletionViewPresenting: Binding<Bool>) {
        self.serviceEventCompletion = serviceEventCompletion
        self.isCompletionViewPresenting = isCompletionViewPresenting
    }

    func sendData() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
            self.isCompletionViewPresenting.wrappedValue.toggle()
        }
    }
}
