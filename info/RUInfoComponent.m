//
//  RUInfoComponent.m
//  info
//
//  Created by Russell Frank on 1/12/14.
//  Copyright (c) 2014 RU. All rights reserved.
//

#import "RUInfoComponent.h"
#import "RUInfoViewController.h"

@interface RUInfoComponent ()

@end

@implementation RUInfoComponent

- (id)initWithDelegate:(id <RUInfoDelegate>)delegate {
    self = [super init];
    if (self) {
        // Custom initialization
        RUInfoViewController * vc = [[RUInfoViewController alloc] initWithDelegate:delegate];
        [self pushViewController:vc animated:NO];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
