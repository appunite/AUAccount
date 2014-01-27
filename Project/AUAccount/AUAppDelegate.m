//
//  AUAppDelegate.m
//  AUAccount
//
//  Created by Emil Wojtaszek on 27.01.2014.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUAppDelegate.h"
#import "AUViewController.h"

@implementation AUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[AUViewController alloc] init];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
