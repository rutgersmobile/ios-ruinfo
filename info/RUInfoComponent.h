//
//  RUInfoComponent.h
//  info
//
//  Created by Russell Frank on 1/12/14.
//  Copyright (c) 2014 RU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RUInfoDelegate.h"

@interface RUInfoComponent : UINavigationController

- (id) initWithDelegate: (id <RUInfoDelegate>) delegate;

@end
