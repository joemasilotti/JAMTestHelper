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
@property (nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

const CGFloat kDelay = 1.0f;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.helloLabel performSelector:@selector(setText:)
                          withObject:@"Hello, world!"
                          afterDelay:kDelay];
}

- (IBAction)stopSpinner {
    [self.activityIndicator performSelector:@selector(stopAnimating)
                                 withObject:nil
                                 afterDelay:kDelay];
}

@end
