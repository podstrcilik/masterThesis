//
//  Publisher.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import Combine

extension Publisher {
    func ignoreError() -> AnyPublisher<Output, Never> {
        self
        .catch {
            _ in Empty()
        }
        .eraseToAnyPublisher()
    }
}
