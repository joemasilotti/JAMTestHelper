//
//  XCTestCase+JAMTestHelper.m
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import "XCTestCase+JAMTestHelper.h"

NSString * const JAMTimeoutException = @"JAMTestHelper Timeout Failure";

const CGFloat kTimeout = 2.0f;

@implementation XCTestCase (JAMTestHelper)

- (void)waitForElementToExist:(XCUIElement *)element {
    [self waitForElement:element toExist:YES];
}

- (void)waitForElementToNotExist:(XCUIElement *)element {
    [self waitForElement:element toExist:NO];
}

#pragma mark - Private

- (void)waitForElement:(XCUIElement *)element toExist:(BOOL)shouldExist {
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
    while (element.exists != shouldExist) {
        if ([NSDate timeIntervalSinceReferenceDate] - startTime > kTimeout) {
            [self raiseTimeoutExceptionForElement:element existing:!shouldExist];
        }

        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
    }
}

- (void)raiseTimeoutExceptionForElementExisting:(XCUIElement *)element {
    [self raiseTimeoutExceptionForElement:element existing:YES];
}

- (void)raiseTimeoutExceptionForElementNotExisting:(XCUIElement *)element {
    [self raiseTimeoutExceptionForElement:element existing:NO];
}

- (void)raiseTimeoutExceptionForElement:(XCUIElement *)element existing:(BOOL)existing {
    NSString *reason = [NSString stringWithFormat:@"Timed out waiting for element (%@) to%@ exist.",
                        element, existing ? @" not" : @""];
    NSException *exception = [NSException exceptionWithName:JAMTimeoutException reason:reason userInfo:nil];
    [exception raise];
}

@end
