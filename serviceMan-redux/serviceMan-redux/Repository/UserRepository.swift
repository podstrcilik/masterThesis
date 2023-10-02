//
//  UserRepository.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 07.05.2023.
//

import Foundation
import Combine

final class UserRepository: ObservableObject {
    
    func logIn(credentials: UserCredentials) -> AnyPublisher<User, RepositoryError> {
        return Just(User.sampleData)
            .delay(for: 1.0, scheduler: RunLoop.main)
            .setFailureType(to: RepositoryError.self)
            .eraseToAnyPublisher()
    }
}

