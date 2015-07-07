//
//  XCTestCase+JAMTestHelper.h
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface XCTestCase (JAMTestHelper)

/**
    Objective-C wrapper around the `XCTAssertThrows()` macro for use in Swift.
 */
- (void)XCTAssertThrows:(void (^)(void))block;

@end
