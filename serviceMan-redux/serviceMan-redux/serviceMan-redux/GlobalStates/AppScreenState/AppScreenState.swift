//
//  AppScreenState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import Foundation

enum AppScreenState {
    case serviceEventList(ServiceEventListState)
    case serviceEvent(ServiceEventDetailState)
    case customer(CustomerDetailState)
    case serviceEventCompletion(ServiceEventCompletionState)
    case tabBar(TabBarState)
    case accountView(AccountViewState)
    case loginView(LoginViewState)
}

extension AppScreenState: CustomStringConvertible {
    var description: String {
        switch self {
        case .serviceEventList(let state): return "serviceEventList(isLoading=\(state.isLoading))"
        case .serviceEvent(let state): return "serviceEvent(\(state.id)"
        case .tabBar: return "tabBar"
        case .loginView(_):
            return "loginView"
        case .customer(let state):
            return "customer(\(state.id)"
        case .serviceEventCompletion(let state):
            return "serviceEventSompletion(\(state.id)"
        case .accountView(_):
            return "accountView"
        }
    }
}

extension AppScreenState {
    static func == (lhs: AppScreenState, rhs: ActiveAppScreen) -> Bool {
        switch (lhs, rhs) {
        case (.loginView, .loginView):
            return true
        case (.accountView, .accountView):
            return true
        case (.tabBar, .tabBar):
            return true
        case (.serviceEvent(let state), .serviceEvent(let id)):
            return state.id == id
        case (.serviceEventCompletion, .serviceEventCompletion):
            return true
        case (.customer(let state), .customer(let id)):
            return state.customer?.id == id
        case (.tabBar, _), (.serviceEvent, _), (.customer, _), (.serviceEventCompletion, _), (.accountView, _),(.loginView, _): return false
        case (.serviceEventList(_), .serviceEventList):
            return true
        case (.serviceEventList(_), _):
            return false
        }
    }

    static func == (lhs: ActiveAppScreen, rhs: AppScreenState) -> Bool {
        rhs == lhs
    }

    static func != (lhs: ActiveAppScreen, rhs: AppScreenState) -> Bool {
        !(lhs == rhs)
    }

    static func != (lhs: AppScreenState, rhs: ActiveAppScreen) -> Bool {
        !(lhs == rhs)
    }
}
