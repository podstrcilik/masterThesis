//
//  ActiveScreensState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

struct ActiveScreensState {
    let screens: [AppScreenState]
}

extension ActiveScreensState {
    init() {
        screens = [.loginView(LoginViewState())]
    }
}
