//
//  LoginViewModel.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var credentials: UserCredentials = UserCredentials(name: "", password: "")
    @Published var isLoggedIn = false
    @Published var loggedUser = User()
    @Published var isLoading = false


    func logIn() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isLoading = false
            self.isLoggedIn = true
            self.loggedUser.firstName = "Pavel"
            self.loggedUser.lastName = "Odstrčilík"
            self.loggedUser.username = "odstrcilik"
        }
    }
}
