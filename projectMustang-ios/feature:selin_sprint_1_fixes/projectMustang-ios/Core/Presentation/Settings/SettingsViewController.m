//
//  SettingsViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-20.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "SettingsViewController.h"
#import "NavigationManager.h"

@implementation SettingsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{

}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    [[NavigationManager singletonInstance] showLogin];
    
}
@end
