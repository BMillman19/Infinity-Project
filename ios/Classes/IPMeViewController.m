//
//  IPMeViewController.m
//  InfinityProject
//
//  Created by Brandon Millman on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IPMeViewController.h"
#import "IPMeView.h"

@interface IPMeViewController ()

@property (nonatomic,strong) IPMeView *meView;

@end

@implementation IPMeViewController

@synthesize meView = _meView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.meView = [[IPMeView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.meView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
