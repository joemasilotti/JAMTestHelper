//
//  JAMTestHelperTestsSwift.swift
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/6/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

import Foundation
import XCTest

class JAMTestHelperTestsSwift: XCTestCase {
    var app = XCUIApplication()

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app.launch()
    }

    func testWaitForElementToExist() {
        let helloLabel = app.staticTexts["Hello, world!"]
        XCTAssertFalse(helloLabel.exists)

        waitForElementToExist(helloLabel)
        XCTAssert(helloLabel.exists)
    }

    func PENDING_testWaitForElementToExistTimeOut() { }

    func testWaitForElementToNotExist() {
        let waitingLabel = app.staticTexts["Waiting..."]
        XCTAssert(waitingLabel.exists)

        waitForElementToNotExist(waitingLabel)
        XCTAssertFalse(waitingLabel.exists)
    }

    func PENDING_testWaitForElementToNotExistTimeOut() { }

    func testWaitForActivityIndicatorToFinish() {
        let stopSpinnerButton = app.buttons["Stop Spinner"]
        stopSpinnerButton.tap()

        let activityIndicator = app.activityIndicators.element
        XCTAssert(activityIndicator.exists)

        waitForActivityIndicatorToFinish()

        let buttonUnderSpinner = app.buttons["Button"]
        buttonUnderSpinner.tap()
    }

    func PENDING_testWaitForActivityIndicatorToFinishTimeOut() { }
}
