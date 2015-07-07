//
//  XCTestCase+JAMTestHelper.m
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import "XCTestCase+JAMTestHelper.h"

@implementation XCTestCase (JAMTestHelper)

- (void)XCTAssertThrows:(void (^)(void))block {
    XCTAssertThrows(block());
}

@end
