//
//  ViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "MainViewController.h"
#import "NavigationManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    CALayer *layer = self.view.layer;
    layer.contents = (id)[UIImage imageNamed:@"main"].CGImage;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
