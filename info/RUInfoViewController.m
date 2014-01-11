//
//  RUInfoViewController.m
//  info
//
//  Created by Russell Frank on 1/11/14.
//  Copyright (c) 2014 RU. All rights reserved.
//

#import "RUInfoViewController.h"
#import "UIButton+NUI.h"
#import "MGScrollView.h"
#import "MGTableBoxStyled.h"
#import "MGLineStyled.h"

@interface RUInfoViewController ()

@end

@implementation RUInfoViewController

- (id)initWithDelegate: (id <RUInfoViewDelegate>) delegate {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"RU-info";
        // Custom initialization
        self.delegate = delegate;
        if ([self.delegate respondsToSelector:@selector(onMenuButtonTapped)]) {
            // delegate expects menu button notification, so let's create and add a menu button
            UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(onMenuButtonTapped)];
            self.navigationItem.leftBarButtonItem = btn;
        }
        
        MGScrollView * scroll = [[MGScrollView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:scroll];
        
        MGTableBoxStyled * topBlurbSection = [MGTableBoxStyled box];
        MGLineStyled * topBlurbLine = [MGLineStyled line];
        topBlurbLine.multilineLeft = @"Contact a helpful Information Assistant at RU-info with your Rutgers questions by calling, texting, or email.";
        topBlurbLine.minHeight = 40;
        topBlurbLine.topPadding = 10;
        topBlurbLine.bottomPadding = 10;
        
        [topBlurbSection.topLines addObject:topBlurbLine];
        
        [scroll.boxes addObject:topBlurbSection];
        
        [scroll.boxes addObject:[self sectionWithTitle:@"**Call RU-info** (732-445-INFO)|mush" body:nil block:^{
            NSLog(@"Call tapped");
        }]];
        
        [scroll.boxes addObject:[self makeTextMsgBox]];
        
        [scroll.boxes addObject:[self sectionWithTitle:@"**Email Colonel Henry** (colhenry@rci.rutgers.edu)|mush" body:nil
            block: ^{
                NSLog(@"email");
            }
        ]];
        
        [scroll layout];
    }
    return self;
}

- (MGTableBoxStyled *) sectionWithTitle:(NSString *)title body:(NSString *)body block: (Block) block {
    MGTableBoxStyled * section = [MGTableBoxStyled box];
    
    UIImage * arrow = [UIImage imageNamed:@"arrow"];
    
    MGLineStyled * titleLine = [MGLineStyled lineWithMultilineLeft:title right:arrow width:304 minHeight:44];
    titleLine.minHeight = 40;
    titleLine.topPadding = 10;
    titleLine.bottomPadding = 10;
    titleLine.onTap = block;
    
    [section.topLines addObject:titleLine];
    
    if (body != nil) {
        MGLineStyled * bodyLine = [MGLineStyled line];
        bodyLine.multilineLeft = body;
        bodyLine.minHeight = 40;
        bodyLine.topPadding = 10;
        bodyLine.bottomPadding = 10;
        [section.topLines addObject:bodyLine];
    
    }
    return section;
}

- (MGTableBoxStyled *) makeTextMsgBox {
    CGSize rowSize = (CGSize){304, 40};
    
    MGTableBoxStyled * section = [MGTableBoxStyled box];
    
    UIImage * arrow = [UIImage imageNamed:@"arrow"];
    
    MGLineStyled * textDescription = [MGLineStyled lineWithMultilineLeft:@"**Text RU-info with your question.** To sign up for RU-info TEXT:|mush" right:nil width:304 minHeight: 44];
    textDescription.topPadding = 10;
    textDescription.bottomPadding = 10;
    [section.topLines addObject: textDescription];
    
    MGLineStyled * signupLine = [MGLineStyled lineWithLeft:@"**Text 'Rutgers' to 66746**|mush" right:arrow size:rowSize];
    [section.topLines addObject: signupLine];
    
    [section.topLines addObject: [MGLineStyled lineWithLeft:@"Or, if you have already signed up:" right:nil size:rowSize]];
    
    MGLineStyled * textLine = [MGLineStyled lineWithLeft:@"**Text your question to 66746**|mush" right:arrow size:rowSize];
    [section.topLines addObject:textLine];

    return section;
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
