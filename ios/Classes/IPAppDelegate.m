//
//  IPAppDelegate.m
//  InfinityProject
//
//  Created by Brandon Millman on 8/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IPAppDelegate.h"

#import "IPMeViewController.h"

@interface IPAppDelegate ()

// The main view controllers
@property (nonatomic, strong) IPMeViewController *meViewController;

@end

@implementation IPAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize meViewController = _meViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Set up the current user profile tab
    self.meViewController = [[IPMeViewController alloc] init];
    UINavigationController *meNavController = [[UINavigationController alloc] initWithRootViewController:self.meViewController];
    UITabBarItem *meTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Me" image:nil tag:0];
    [meNavController setTabBarItem:meTabBarItem];
    
    // Set up the tab bar controller
    self.tabBarController = [[UITabBarController alloc] init];
    [self.tabBarController setDelegate:self];
    [self.tabBarController setViewControllers:[NSArray arrayWithObjects: meNavController, nil]];
    
    // Finish and return
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
