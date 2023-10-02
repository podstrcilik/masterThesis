//
//  UserMiddleware.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 07.05.2023.
//

import Foundation
import Combine

extension Middlewares {
    private static let userRepository = UserRepository()

    static let user: Middleware<AppState> = { state, action in
        switch action {
        case LoginViewStateAction.postLogin(let credentials):
            return userRepository
                .logIn(credentials: credentials)
                .map { LoginViewStateAction.didLogin($0) }
                .ignoreError()
                .eraseToAnyPublisher()
        default:
            return Empty().eraseToAnyPublisher()
        }
    }
}
