//
//  JAMTestHelper.swift
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/6/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func waitForElementToExist(element: XCUIElement) {
        waitForElement(element, toExist: true)
    }

    func waitForElementToNotExist(element: XCUIElement) {
        waitForElement(element, toExist: false)
    }

    func waitForActivityIndicatorToFinish() {
        let spinnerQuery = XCUIApplication().activityIndicators

        let expression = { () -> Bool in
            return spinnerQuery.element.value!.integerValue != 1
        }
        waitFor(expression, failureMessage: "Timed out waiting for spinner to finish.")
    }

    // MARK: Private

    private func waitForElement(element: XCUIElement, toExist: Bool) {
        let expression = { () -> Bool in
            return element.exists == toExist
        }
        waitFor(expression, failureMessage: "Timed out waiting for element to exist.")
    }

    private func waitFor(expression: () -> Bool, failureMessage: String) {
        let startTime = NSDate.timeIntervalSinceReferenceDate()

        while (!expression()) {
            if (NSDate.timeIntervalSinceReferenceDate() - startTime > 2.0) {
                raiseTimeOutException(failureMessage)
            }
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, Boolean(0))
        }
    }

    private func raiseTimeOutException(message: String) {
        NSException(name: "JAMTestHelper Timeout Failure", reason: message, userInfo: nil).raise()
    }
}
