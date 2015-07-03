//
//  XCTestCase+JAMTestHelpers.h
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import <XCTest/XCTest.h>

FOUNDATION_EXPORT NSString * const JAMTimeoutException;

@interface XCTestCase (JAMTestHelpers)

- (void)waitForElementToExist:(XCUIElement *)element;
- (void)waitForElementToNotExist:(XCUIElement *)element;

@end
