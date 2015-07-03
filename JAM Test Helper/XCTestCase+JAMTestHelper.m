//
//  XCTestCase+JAMTestHelper.m
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import "XCTestCase+JAMTestHelper.h"

typedef BOOL (^WaitForExpression)();

NSString * const JAMTimeoutException = @"JAMTestHelper Timeout Failure";

const CGFloat kTimeout = 2.0f;

@implementation XCTestCase (JAMTestHelper)

- (void)waitForElementToExist:(XCUIElement *)element {
    NSException *exception = [self timeoutExceptionForElement:element shouldExist:YES];
    [self waitFor:^BOOL{
        return element.exists;
    } withException:exception];
}

- (void)waitForElementToNotExist:(XCUIElement *)element {
    NSException *exception = [self timeoutExceptionForElement:element shouldExist:NO];
    [self waitFor:^BOOL{
        return !element.exists;
    } withException:exception];
}

- (void)waitForActivityIndicatorToFinish {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *spinnerQuery = app.activityIndicators;
    NSException *exception = [self timeoutExceptionForActivityIndicator];

    [self waitFor:^BOOL {
        return [spinnerQuery.element.value integerValue] != 1;
    } withException:exception];
}

#pragma mark - Private

- (void)waitForElement:(XCUIElement *)element toExist:(BOOL)shouldExist {
    NSException *exception = [self timeoutExceptionForElement:element shouldExist:shouldExist];
    [self waitFor:^BOOL{
        return element.exists == shouldExist;
    } withException:exception];
}

- (void)waitFor:(WaitForExpression)expression withException:(NSException *)exception {
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];

    while (!expression()) {
        if ([NSDate timeIntervalSinceReferenceDate] - startTime > kTimeout) {
            [exception raise];
        }
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, false);
    }
}

- (NSException *)timeoutExceptionForElementExisting:(XCUIElement *)element {
    return [self timeoutExceptionForElement:element shouldExist:YES];
}

- (NSException *)timeoutExceptionForElementNotExisting:(XCUIElement *)element {
    return [self timeoutExceptionForElement:element shouldExist:NO];
}

- (NSException *)timeoutExceptionForActivityIndicator {
    return [self timeoutExceptionWithReason:@"TImed out waiting for activity indicator to finish."];
}

- (NSException *)timeoutExceptionForElement:(XCUIElement *)element shouldExist:(BOOL)shouldExist {
    NSString *reason = [NSString stringWithFormat:@"Timed out waiting for element (%@) to%@ exist.",
                        element, shouldExist ? @"" : @" not"];
    return [self timeoutExceptionWithReason:reason];
}

- (NSException *)timeoutExceptionWithReason:(NSString *)reason {
    return [NSException exceptionWithName:JAMTimeoutException reason:reason userInfo:nil];
}

@end
