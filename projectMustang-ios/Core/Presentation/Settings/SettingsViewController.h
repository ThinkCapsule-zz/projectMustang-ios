//
//  SettingsViewController.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-20.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface SettingsViewController : BaseViewController <FBSDKLoginButtonDelegate>

@property (nonatomic, strong
           ) FBSDKLoginButton* loginButton;

@end
