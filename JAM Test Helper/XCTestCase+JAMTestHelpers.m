//
//  XCTestCase+JAMTestHelpers.m
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import "XCTestCase+JAMTestHelpers.h"

NSString * const JAMTimeoutException = @"JAMTestHelper Timeout Failure";

const CGFloat kTimeout = 2.0f;

@implementation XCTestCase (JAMTestHelpers)

- (void)waitForElementToExist:(XCUIElement *)element {
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
    while (!element.exists) {
        if ([NSDate timeIntervalSinceReferenceDate] - startTime > kTimeout) {
            [self raiseTimeoutExceptionForElementNotExisting:element];
        }

        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
    }
}

- (void)waitForElementToNotExist:(XCUIElement *)element {
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
    while (element.exists) {
        if ([NSDate timeIntervalSinceReferenceDate] - startTime > kTimeout) {
            [self raiseTimeoutExceptionForElementNotExisting:element];
        }

        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
    }
}

#pragma mark - Private

- (void)raiseTimeoutExceptionForElementExisting:(XCUIElement *)element {
    NSString *reason = [NSString stringWithFormat:@"Timed out waiting for element (%@) to not exist.", element];
    NSException *exception = [NSException exceptionWithName:JAMTimeoutException reason:reason userInfo:nil];
    [exception raise];
}

- (void)raiseTimeoutExceptionForElementNotExisting:(XCUIElement *)element {
    NSString *reason = [NSString stringWithFormat:@"Timed out waiting for element (%@) to exist.", element];
    NSException *exception = [NSException exceptionWithName:JAMTimeoutException reason:reason userInfo:nil];
    [exception raise];
}

@end
