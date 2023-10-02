//
//  Store.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 29.04.2023.
//

import Combine
import Foundation

final class Store<State>: ObservableObject {
    @Published private(set) var state: State

    private var subscriptions: [UUID: AnyCancellable] = [:]

    private let dispatchQueue = DispatchQueue(label: "serviceMan", qos: .userInitiated)
    private let reducer: Reducer<State>
    private let middlewares: [Middleware<State>]

    init(initial: State, reducer: @escaping Reducer<State>, middlewares: [Middleware<State>]) {
        self.reducer = reducer
        self.state = initial
        self.middlewares = middlewares
    }

    func dispatch(_ newAction: Action) {
        dispatchQueue.sync {
            dispatchToNewState(actualState: state, action: newAction)
        }
    }

    private func dispatchToNewState(actualState: State, action: Action) {
        let newState = reducer(actualState, action)

        for middleware in middlewares {
            let key = UUID()
            middleware(newState, action)
                .receive(on: RunLoop.main)
                .handleEvents(receiveCompletion: { [weak self] _ in self?.subscriptions.removeValue(forKey: key) })
                .sink(receiveValue: dispatch)
                .store(in: &subscriptions, uuIDKey: key)
        }

        state = newState
    }
}

