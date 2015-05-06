//
//  NavigationManager.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "NavigationManager.h"
#import "MainViewController.h"
#import "TCMainMenuVC.h"
#import <RESideMenu/RESideMenu.h>

@interface NavigationManager ()

@end

@implementation NavigationManager

+(NavigationManager* )singletonInstance {
    
    /* Create singleton instance of NavigationManager to be used everywhere */
    static dispatch_once_t once_token;
    static NavigationManager *_singletonInstance = nil;
    
    dispatch_once(&once_token, ^{
        _singletonInstance = [[NavigationManager alloc] init];
    });
    
    return _singletonInstance;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMeamoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
