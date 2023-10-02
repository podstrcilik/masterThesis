//
//  CustomerDetailAction.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 04.05.2023.
//

import Foundation

enum CustomerDetailAction: Action {
    case getCustomer(id: String)
    case didReceiveCustomer(Customer)
    case openAppleMaps(Customer)
}
