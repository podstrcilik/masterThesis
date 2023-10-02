//
//  AppState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

struct AppState {
    let activeScreens: ActiveScreensState
}

extension AppState {
    init() {
        activeScreens = ActiveScreensState()
    }
}
