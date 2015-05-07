//
//  TCBaseVC.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"
#import <SQTShyNavigationBar.h>

@implementation BaseViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.navigationController.shyNavigationBar.shyHeight = 44.0f;
    self.navigationController.shyNavigationBar.fullHeight = 80.0f;
}

@end