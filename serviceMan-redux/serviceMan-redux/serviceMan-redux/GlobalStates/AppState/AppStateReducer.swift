//
//  AppStateReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(
            activeScreens: ActiveScreensState.reducer(state.activeScreens, action)
        )
    }
}
