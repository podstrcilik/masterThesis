//
//  LoginViewReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 06.05.2023.
//

import Foundation

extension LoginViewState {
    static let reducer: Reducer<Self> = { state, action in
        guard let action = action as? LoginViewStateAction else { return state }
        switch action {
        case .postLogin(let crendetials):
            return LoginViewState(credentials: crendetials, isLoading: true)
        case .updateNameText(let text):
            let credentials = UserCredentials(name: text, password: state.credentials.password)
            return LoginViewState(credentials: credentials, isLoading: false)
        case .updatePasswordText(let text):
            let credentials = UserCredentials(name: state.credentials.name, password: text)
            return LoginViewState(credentials: credentials, isLoading: false)
        case .didLogin(let user):
            return LoginViewState(credentials: state.credentials, isLoading: false, loggedUser: user)
        }
    }
}
