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
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:backgroundView];
    
    self.loginButton = [[FBSDKLoginButton alloc] init];
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.loginButton];
    
    self.loginButton.delegate = self;
    
    [self setupConstraints];
}

#pragma mark - Autolayout
- (void)setupConstraints{
    
    NSDictionary *viewsDictionary = @{@"loginButton":self.loginButton};
    
    NSArray *loginbutton_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[loginButton]-30-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *loginbutton_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[loginButton]-30-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    [self.view addConstraints:loginbutton_POS_V];
    [self.view addConstraints:loginbutton_POS_H];
    
}

#pragma mark - FBSDKLoginButtonDelegate Methods
- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[NavigationManager singletonInstance] goToMainSection];
    }
    
    
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
    
}
@end
