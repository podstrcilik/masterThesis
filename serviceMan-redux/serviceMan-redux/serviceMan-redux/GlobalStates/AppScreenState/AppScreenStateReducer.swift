//
//  AppScreenStateReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import Foundation

extension AppScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch state {
        case .serviceEventList(let state):
            return .serviceEventList(ServiceEventListState.reducer(state, action))
        case .serviceEvent(let state):
            return .serviceEvent(ServiceEventDetailState.reducer(state, action))
        case .customer(let state):
            return .customer(CustomerDetailState.reducer(state, action))
        case .serviceEventCompletion(let state):
            return .serviceEventCompletion(ServiceEventCompletionState.reducer(state, action))
        case .tabBar(let state):
            return .tabBar(TabBarState.reducer(state, action))
        case .accountView(let state):
            return .accountView(AccountViewState.reducer(state, action))
        case .loginView(let state):
            return .loginView(LoginViewState.reducer(state, action))
        }
    }
}
