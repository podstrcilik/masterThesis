//
//  LoginViewState.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 06.05.2023.
//

import Foundation

struct LoginViewState {
    var credentials: UserCredentials
    var isLoading: Bool
    var loggedUser: User?
}

extension LoginViewState {
    init() {
        isLoading = false
        credentials = UserCredentials(name: "", password: "")
        loggedUser = nil
    }
}
