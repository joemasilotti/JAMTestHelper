//
//  XCTestCase+JAMTestHelper.h
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import <XCTest/XCTest.h>

FOUNDATION_EXPORT NSString * const JAMTimeoutException;

/**
 * Adds a few methods to XCTest geared towards UI Testing in Xcode 7 and iOS 9.
 *
 * Import this category into your UI Testing tests to wait for elements and 
 * activity items to appear or dissappear. 
 *
 * @note The default timeout is two seconds.
 */
@interface XCTestCase (JAMTestHelper)

/**
 * Waits for the default timeout until `element.exists` is true.
 *
 * @param element the element you are waiting for
 * @see waitForElementToNotExist:
 */
- (void)waitForElementToExist:(XCUIElement *)element;

/**
 * Waits for the default timeout until `element.exists` is false.
 *
 * @param element the element you are waiting for
 * @see waitForElementToExist:
 */
- (void)waitForElementToNotExist:(XCUIElement *)element;

/**
 * Waits for the default timeout until the activity indicator stop spinning.
 *
 * @note Should only be used if one `UIActivityIndicator` is present.
 */
- (void)waitForActivityIndicatorToFinish;

@end
