//
//  ActiveScreensStateReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

extension ActiveScreensState {
    static let reducer: Reducer<Self> = { state, action in
        var screens = state.screens

        if let action = action as? ActiveScreensStateAction {
            switch action {
            case .showScreen(.loginView):
                screens = [.loginView(LoginViewState())]
            case .showScreen(.tabBar):
                screens = [.tabBar(TabBarState())]
            case .showScreen(.accountView):
                screens += [.accountView(AccountViewState())]
            case .showScreen(.serviceEventList):
                screens += [.serviceEventList(ServiceEventListState())]
            case .showScreen(.serviceEvent(let id)):
                screens += [.serviceEvent(ServiceEventDetailState(id: id))]
            case .showScreen(.customer(let id)):
                screens += [.customer(CustomerDetailState(id: id))]
            case .showScreen(.serviceEventCompletion(let id)):
                screens += [.serviceEventCompletion(ServiceEventCompletionState(id: id))]
            case .dismissScreen(let screen):
                screens = screens.filter({$0 != screen})
            }
        }

        screens = screens.map {
            AppScreenState.reducer($0, action)
        }

        return ActiveScreensState(screens: screens)
    }
}
