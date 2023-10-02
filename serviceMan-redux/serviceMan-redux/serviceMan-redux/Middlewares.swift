//
//  Middlewares.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 17.05.2023.
//

import Foundation
import Combine

enum Middlewares {}

typealias Middleware<State> = (State, Action) -> AnyPublisher<Action, Never>
