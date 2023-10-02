//
//  CustomerDetailState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 04.05.2023.
//

import Foundation

struct CustomerDetailState {
    let id: String
    let customer: Customer?
}

extension CustomerDetailState {
    init(id: String) {
        self.id = id
        customer = nil
    }
}
