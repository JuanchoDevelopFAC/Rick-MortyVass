//
//  Rick_and_Morty_VASSUITestsLaunchTests.swift
//  Rick-and-Morty-VASSUITests
//
//  Created by Juan Fernando Alvarez Carvajal on 13/12/23.
//

import XCTest

final class Rick_and_Morty_VASSUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
