//
//  AUAccount.h
//  Yapert
//
//  Created by Emil Wojtaszek on 07.12.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

// Frameworks
#import <Foundation/Foundation.h>
#import "SSKeychain.h"

@class AUAccount;
typedef void (^AUAccountLogoutBlock)(AUAccount* account, id<NSCoding, NSCoding> user);

@interface AUAccount : NSObject

/**
 *  Creates and initializes an `AUAccount` object
 *
 *  @return The newly-initialized account object
 */
+ (instancetype)account;

/**
 *  User connected with account
 */
@property (nonatomic, strong, readonly) id<NSCopying, NSCoding> user;

@property (nonatomic, strong, readonly) NSString *accountType;
@property (nonatomic, strong, readonly) NSDate *expirationDate;
@property (nonatomic, strong, readonly) NSDate *loginDate;

- (NSString *)authenticationToken:(NSError **)error;

/**
 *  Register new user
 *
 *  @param accounType Text account description
 */
- (void)registerAccountWithType:(NSString *)accounType;

/**
 *  Register new user
 *
 *  @param token          Authentication toke
 *  @param expirationDate Expiration date of authentication token
 *  @param accounType     Text account description
 *  @param error          Keychain add password error
 *
 *  @return Error while adding token to keychain
 */
- (BOOL)registerAccountWithAuthenticationToken:(NSString *)token
                                expirationDate:(NSDate *)expirationDate
                                   accountType:(NSString *)accounType
                                         error:(NSError **)error;

/**
 *  Assign new user data to account
 *
 *  @param user New user object
 */
- (void)updateUser:(id<NSCopying, NSCoding>)user;

/**
 *  Check if account has assiggned to any user
 *
 *  @return YES if account has assign to any user
 */
- (BOOL)isLoggedIn;

/**
 *  Perform logout action
 */
- (void)logout;

/**
 *  Block invoked in logout methos. Use it to clean update data after logout.
 */
@property (nonatomic, copy) AUAccountLogoutBlock logoutBlock;

@end

// Account Types
extern NSString * const AUAccountTypeCustom;
extern NSString * const AUAccountTypeTwitter;
extern NSString * const AUAccountTypeFacebook;

// Notifications
extern NSString * const AUAccountDidLoginUserNotification;
extern NSString * const AUAccountWillLogoutUserNotification;
extern NSString * const AUAccountDidLogoutUserNotification;
extern NSString * const AUAccountDidUpdateUserNotification;

// User Defaults Keys
extern NSString * const kAUAccountKey;

