//
//  AnyCancellable.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import Foundation
import Combine

extension AnyCancellable {
    func store(in dict: inout [UUID: AnyCancellable], uuIDKey: UUID) {
        dict[uuIDKey] = self
    }
}
