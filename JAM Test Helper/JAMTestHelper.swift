//
//  JAMTestHelper.swift
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/6/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

import Foundation
import XCTest

/**
* Adds a few methods to XCTest geared towards UI Testing in Xcode 7 and iOS 9.
*
* Import this extension into your UI Testing tests to wait for elements and
* activity items to appear or dissappear.
*
* @note The default timeout is two seconds.
*/
public extension XCTestCase {
    /**
    * Waits for the default timeout until `element.exists` is true.
    *
    * @param element the element you are waiting for
    * @see waitForElementToNotExist()
    */
    func waitForElementToExist(element: XCUIElement) {
        waitForElement(element, toExist: true)
    }

    /**
    * Waits for the default timeout until `element.exists` is false.
    *
    * @param element the element you are waiting for
    * @see waitForElementToExist()
    */
    func waitForElementToNotExist(element: XCUIElement) {
        waitForElement(element, toExist: false)
    }

    /**
    * Waits for the default timeout until the activity indicator stop spinning.
    *
    * @note Should only be used if one `ActivityIndicator` is present.
    */
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
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, Bool(0))
        }
    }

    private func raiseTimeOutException(message: String) {
        NSException(name: "JAMTestHelper Timeout Failure", reason: message, userInfo: nil).raise()
    }
}
