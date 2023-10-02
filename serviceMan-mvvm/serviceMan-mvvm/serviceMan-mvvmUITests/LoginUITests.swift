//
//  serviceMan_mvvmUITests.swift
//  serviceMan-mvvmUITests
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import XCTest

final class LoginUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testLogIn() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Jméno"].exists)

        XCTAssertTrue(app.staticTexts["Heslo"].exists)

        let nameTextField = app.textFields["Jméno"]
        XCTAssertTrue(nameTextField.exists)

        nameTextField.tap()

        nameTextField.typeText("pavelodstrcilik")

        let passwordSecureTextField = app.secureTextFields["Heslo"]
        XCTAssertTrue(passwordSecureTextField.exists)

        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("123456789")

        let logInButton = app.buttons["Přihlásit se"]
        XCTAssertTrue(logInButton.exists)
        logInButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
