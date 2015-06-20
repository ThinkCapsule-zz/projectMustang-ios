//
//  TCBaseVC.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self setupCustomNavigationBar];
    
}

- (void) setupCustomNavigationBar{
    
    // Customize navigation bar
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.navigationController.navigationBar.barStyle          = UIBarStyleBlackTranslucent;
    UIImage *image                                            = [UIImage imageNamed:@"navbar_logo"];
    UIImageView *imageView                                    = [[UIImageView alloc] initWithImage:image];
    self.navigationController.navigationBar.topItem.titleView = imageView;
    
    self.navigationItem.leftBarButtonItem                     = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_menu_icon"]
                                                                                   landscapeImagePhone:nil
                                                                                                 style:UIBarButtonItemStylePlain
                                                                                                target:self
                                                                                                action:@selector(presentLeftMenuViewController:)];
    self.navigationItem.leftBarButtonItem.tintColor           = [UIColor whiteColor];
}

@end