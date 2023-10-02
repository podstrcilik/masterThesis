//
//  serviceMan_mvvmTests.swift
//  serviceMan-mvvmTests
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import XCTest
@testable import serviceMan_mvvm

final class serviceMan_mvvmTests: XCTestCase {
    func testLogIn() throws {
        let isLoading = false
        let isLoggedIn = false
        let firstName = ""
        let lastName = ""
        let username = ""

        let viewModel = LoginViewModel()

        XCTAssertFalse(isLoading)
        XCTAssertFalse(isLoggedIn)
        XCTAssertEqual(viewModel.loggedUser.firstName, firstName)
        XCTAssertEqual(viewModel.loggedUser.lastName, lastName)
        XCTAssertEqual(viewModel.loggedUser.username, username)

        viewModel.logIn()
        XCTAssertTrue(viewModel.isLoading)
    }
}
