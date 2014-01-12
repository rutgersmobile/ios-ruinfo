//
//  RUInfoViewController.h
//  info
//
//  Created by Russell Frank on 1/11/14.
//  Copyright (c) 2014 RU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RUInfoDelegate.h"

@interface RUInfoViewController : UIViewController

@property (nonatomic) id <RUInfoDelegate> delegate;

- (id) initWithDelegate: (id <RUInfoDelegate>) delegate;

@end
