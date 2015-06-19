//
//  SettingsViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-19.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "SettingsViewController.h"
#import "NavigationManager.h"

@implementation SettingsViewController

- (void) viewDidLoad {
    
    // Set title
    self.title = @"Settings";
    
    // Setup facebook login button
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
}

#pragma mark - FBSDKLoginButtonDelegate Methods
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
   
    // Do something after login
    
}
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
    [[NavigationManager singletonInstance] showLogin];
    
}

@end
