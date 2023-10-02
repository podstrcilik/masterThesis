//
//  ServiceEventListRepository.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation
import Combine

class ServiceEventListRepository: ObservableObject {
    
    func fetchEvents() -> AnyPublisher<[ServiceEvent], RepositoryError> {
        return Just(ServiceEvent.sampleData)
            .delay(for: 1.0, scheduler: RunLoop.main)
            .setFailureType(to: RepositoryError.self)
            .eraseToAnyPublisher()
    }
}
