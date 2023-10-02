//
//  ActiveScreensStateAction.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import Foundation

enum ActiveScreensStateAction: Action {
    case showScreen(ActiveAppScreen)
    case dismissScreen(ActiveAppScreen)
}
