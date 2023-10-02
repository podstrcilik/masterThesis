//
//  User.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 23.04.2023.
//

import Foundation

class User: ObservableObject {
    @Published var id: String = ""
    @Published var username: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
}

extension User {
    static var sampleData: User {
        let user = User()
        user.id = "10"
        user.firstName = "Pavel"
        user.lastName = "Odstrčilík"
        user.username = "odstrcilik"
        return user
    }
}
