//
//  TCWalkthroughViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "TCWalkthroughViewController.h"
#import "NavigationManager.h"
#import "SystemStatics.h"

@interface TCWalkthroughViewController ()

@end

@implementation TCWalkthroughViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* btnGoHome = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [btnGoHome setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnGoHome setTitle:@"Finish" forState:UIControlStateNormal];
    [btnGoHome addTarget:self action:@selector(goToAppContent) forControlEvents:UIControlEventTouchUpInside];
    btnGoHome.center = self.view.center;
    [self.view addSubview:btnGoHome];
    
    
}
- (void) goToAppContent {
    
    [[NavigationManager singletonInstance] goToMainSection];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:kUserHasOnboarded];
    
}
- (void)didReceiveMemoryWarning {
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
