//
//  ActiveAppScreen.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

enum ActiveAppScreen {
    case serviceEventList
    case serviceEvent(id: String)
    case customer(id: String)
    case serviceEventCompletion(id: String)
    case tabBar
    case accountView
    case loginView
}
