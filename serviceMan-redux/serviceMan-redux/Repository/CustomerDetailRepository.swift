//
//  CustomerDetailRepository.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 04.05.2023.
//

import Foundation
import Combine

class CustomerDetailRepository: ObservableObject {
    
    func fetchCustomer(id: String) -> AnyPublisher<Customer, RepositoryError> {
        let events = ServiceEvent.sampleData.first(where: {$0.customer.id == id })?.customer ?? ServiceEvent.sampleData[1].customer
        
        return Just(events)
            .setFailureType(to: RepositoryError.self)
            .eraseToAnyPublisher()
    }
}
