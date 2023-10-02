//
//  ServiceEventDetailRepository.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 02.05.2023.
//

import Foundation
import Combine

class ServiceEventDetailRepository: ObservableObject {
    
    func fetchEvent(id: String) -> AnyPublisher<ServiceEvent, RepositoryError> {
        let events = ServiceEvent.sampleData.first(where: {$0.id == id }) ?? ServiceEvent.sampleData[1]
        
        return Just(events)
            .setFailureType(to: RepositoryError.self)
            .eraseToAnyPublisher()
    }
    
    func postCompletion(_ completion: ServiceEventCompletion) -> AnyPublisher<Bool, RepositoryError> {
        return Just(true)
            .delay(for: 1.0, scheduler: RunLoop.main)
            .setFailureType(to: RepositoryError.self)
            .eraseToAnyPublisher()
    }
}
