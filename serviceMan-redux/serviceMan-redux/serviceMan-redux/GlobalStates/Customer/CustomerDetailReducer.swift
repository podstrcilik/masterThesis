//
//  CustomerDetailReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 04.05.2023.
//

import Foundation

extension CustomerDetailState {
    static let reducer: Reducer<Self> = { state, action in
        guard let action = action as? CustomerDetailAction else { return state }
        switch action {
        case .getCustomer(let id):
            return CustomerDetailState(id: id,
                                       customer: nil)
        case .didReceiveCustomer(let customer):
            return CustomerDetailState(id: customer.id,
                                       customer: customer)
        case .openAppleMaps(let customer):
            return CustomerDetailState(id: customer.id,
                                       customer: customer)
        }
    }
}
