//
//  LoginViewStateAction.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 06.05.2023.
//

import Foundation

enum LoginViewStateAction: Action {
    case postLogin(UserCredentials)
    case updateNameText(String)
    case updatePasswordText(String)
    case didLogin(User)
}
