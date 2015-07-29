//
//  TCBaseVC.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "BaseViewController.h"

@implementation BaseViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self setupCustomNavigationBar];
    
}

- (void) setupCustomNavigationBar{
    
    // Customize navigation bar
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.navigationController.navigationBar.barStyle          = UIStatusBarStyleDefault;
    UIImage *image                                            = [UIImage imageNamed:@"navbar_logo"];
    UIImageView *imageView                                    = [[UIImageView alloc] initWithImage:image];
    self.navigationController.navigationBar.topItem.titleView = imageView;
    
    //[self.navigationController.navigationBar.layer setBorderWidth:0.5];// Just to make sure its working
    //[self.navigationController.navigationBar.layer setBorderColor:[[UIColor grayColor] CGColor]];

    //[self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.navigationItem.leftBarButtonItem                     = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_menu_icon"]
                                                                                   landscapeImagePhone:nil
                                                                                                 style:UIBarButtonItemStylePlain
                                                                                                target:self
                                                                                                action:@selector(presentLeftMenuViewController:)];
    self.navigationItem.leftBarButtonItem.tintColor           = UIColorFromRGB(0xFF5722);
}

@end