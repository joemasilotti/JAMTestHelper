//
//  ViewController.m
//  JAMTestHelper
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) IBOutlet UILabel *helloLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.helloLabel performSelector:@selector(setText:)
                          withObject:@"Hello, world!"
                          afterDelay:1.0f];
}

@end
