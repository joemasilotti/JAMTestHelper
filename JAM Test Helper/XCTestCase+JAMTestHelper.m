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

- (void)waitForActivityIndicatorToFinish {
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];

    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *spinnerQuery = app.activityIndicators;
    while ([spinnerQuery.element.value integerValue] == 1) {
        if ([NSDate timeIntervalSinceReferenceDate] - startTime > kTimeout) {
            [self raiseTimeoutExceptionForActivityIndicator];
        }
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
    }
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

- (void)raiseTimeoutExceptionForActivityIndicator {
    [self raiseTimeoutExceptionWithReason:@"TImed out waiting for activity indicator to finish."];
}

- (void)raiseTimeoutExceptionForElement:(XCUIElement *)element existing:(BOOL)existing {
    NSString *reason = [NSString stringWithFormat:@"Timed out waiting for element (%@) to%@ exist.",
                        element, existing ? @" not" : @""];
    [self raiseTimeoutExceptionWithReason:reason];
}

- (void)raiseTimeoutExceptionWithReason:(NSString *)reason {
    [[NSException exceptionWithName:JAMTimeoutException reason:reason userInfo:nil] raise];
}

@end
