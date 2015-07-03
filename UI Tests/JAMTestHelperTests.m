//
//  JAMTestHelperUITests.m
//  JAMTestHelperUITests
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@interface JAMTestHelperTests : XCTestCase

@end

@implementation JAMTestHelperTests

- (void)setUp {
    [super setUp];
    
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)testExample {
    XCTAssertTrue(YES);
}

@end
