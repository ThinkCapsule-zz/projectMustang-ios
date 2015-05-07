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
    [self setupCustomNavigationBar];
    
}

- (void) setupCustomNavigationBar{
    
    self.navigationController.shyNavigationBar.shyHeight  = 44.0f;
    self.navigationController.shyNavigationBar.fullHeight = 80.0f;
    self.navigationItem.leftBarButtonItem                 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_menu_icon"]
                                                                               landscapeImagePhone:nil
                                                                                             style:UIBarButtonItemStylePlain
                                                                                            target:self
                                                                                            action:@selector(presentLeftMenuViewController:)];

}

@end