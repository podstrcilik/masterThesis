//
//  AppState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import Foundation

extension AppState {
    func screenState<State>(for screen: ActiveAppScreen) -> State? {
        return activeScreens.screens
            .compactMap {
                switch ($0, screen) {
                case (.serviceEventList(let state), .serviceEventList):
                    return state as? State
                case (.serviceEvent(let state), .serviceEvent(let id)) where state.id == id:
                    return state as? State
                case (.customer(let state), .customer(let id)) where state.id == id:
                    return state as? State
                case (.serviceEventCompletion(let state), .serviceEventCompletion(let id)) where state.id == id:
                    return state as? State
                case (.tabBar(let state), .tabBar):
                    return state as? State
                case (.accountView(let state), .accountView):
                    return state as? State
                case (.loginView(let state), .loginView):
                    return state as? State
                default:
                    return nil
                }
            }.first
    }
}
