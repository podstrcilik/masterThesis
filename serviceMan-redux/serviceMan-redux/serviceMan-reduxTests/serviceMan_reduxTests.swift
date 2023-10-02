//
//  serviceMan_reduxTests.swift
//  serviceMan-reduxTests
//
//  Created by Pavel Odstrčilík on 29.04.2023.
//

import XCTest
@testable import serviceMan_redux

final class serviceMan_reduxTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogInActions() throws {
        let initialState = LoginViewState(credentials: UserCredentials(name: "", password: ""), isLoading: false)

        let credentailName = "pavel"
        let credentailPassword = "password"
        let postLoginAction = LoginViewStateAction.postLogin(UserCredentials(name: credentailName, password: credentailPassword))
        let postLoginState = LoginViewState.reducer(initialState, postLoginAction)
        XCTAssertEqual(postLoginState.credentials.name, credentailName)
        XCTAssertEqual(postLoginState.credentials.password, credentailPassword)
        XCTAssertTrue(postLoginState.isLoading)

        let nameText = "Pavel"
        let updateNameTextAction = LoginViewStateAction.updateNameText(nameText)
        let postUpdateNameTextState = LoginViewState.reducer(initialState, updateNameTextAction)
        XCTAssertEqual(postUpdateNameTextState.credentials.name, nameText)
        XCTAssertEqual(postUpdateNameTextState.credentials.password, "")
        XCTAssertFalse(postUpdateNameTextState.isLoading)

        let passwordText = "newPasword"
        let updatePasswordTextAction = LoginViewStateAction.updatePasswordText(passwordText)
        let postUpdatePasswordTextAction = LoginViewState.reducer(initialState, updatePasswordTextAction)
        XCTAssertEqual(postUpdatePasswordTextAction.credentials.name, "")
        XCTAssertEqual(postUpdatePasswordTextAction.credentials.password, passwordText)
        XCTAssertFalse(postUpdatePasswordTextAction.isLoading)

        let user = User.sampleData
        let didLoginAction = LoginViewStateAction.didLogin(user)
        let postDidLoginAction = LoginViewState.reducer(initialState, didLoginAction)
        XCTAssertFalse(postDidLoginAction.isLoading)
        XCTAssertEqual(postDidLoginAction.loggedUser?.firstName, user.firstName)
        XCTAssertEqual(postDidLoginAction.loggedUser?.lastName, user.lastName)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
