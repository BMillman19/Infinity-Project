//
//  IPAppDelegate.h
//  InfinityProject
//
//  Created by Brandon Millman on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IPViewController;

@interface IPAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end
