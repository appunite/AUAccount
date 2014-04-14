//
//  AUAppDelegate.m
//  AUAccount
//
//  Created by Emil Wojtaszek on 27.01.2014.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUAppDelegate.h"
#import "AUViewController.h"

//Others
#import "AUAccount.h"

@implementation AUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[AUViewController alloc] init];
    [self.window makeKeyAndVisible];

    // add observers
    [self _addObservers];
    
    // share account object
    AUAccount *account = [AUAccount account];

    // logout
    if ([account isLoggedIn]) {
        
        // preform logout process
        [account logout];
    }
    
    else {
        NSError *error = nil;

        // register new user account
        [account registerAccountWithAuthenticationToken:@"LG0MgRLFclnRwCEZ2t"
                                         expirationDate:[NSDate date]
                                            accountType:AUAccountTypeCustom
                                                  error:&error];
        if (error) {
            NSLog(@"%@", error);
        }
        
        // prepare example user description object
        NSDictionary *params = @{
            @"name": @"John",
            @"surname": @"Smith"
        };
        
        // update account's user object
        [account updateUser:params];
    }
    
    return YES;
}

#pragma mark - 
#pragma mark Others

- (void)_addObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_accountNotificationSelector:) name:AUAccountDidLoginUserNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_accountNotificationSelector:) name:AUAccountWillLogoutUserNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_accountNotificationSelector:) name:AUAccountDidLogoutUserNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_accountNotificationSelector:) name:AUAccountDidUpdateUserNotification object:nil];
}

- (void)_accountNotificationSelector:(NSNotification *)note {
    AUAccount *account = [AUAccount account];
    NSLog(@"Notification: %@, account: %@, createdAt:%@, user:\n%@", note.name, account.accountType, account.loginDate, account.user);
}

@end
