//
//  LoggerMiddleware.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 07.05.2023.
//

import Foundation
import Combine

extension Middlewares {
    static let logger: Middleware<AppState> = { state, action in
        print("Action: \(action)")
        print("State: \(state)")

        return Empty().eraseToAnyPublisher()
    }
}
