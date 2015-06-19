//
//  SignOnViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "SignOnViewController.h"
#import "NavigationManager.h"

@implementation SignOnViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    loginButton.delegate = self;
}

#pragma mark - FBSDKLoginButtonDelegate Methods
- (void)  loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[NavigationManager singletonInstance] goToMainSection];
    }
    
    
}

/*!
 @abstract Sent to the delegate when the button was used to logout.
 @param loginButton The button that was clicked.
 */
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
    
}
@end
