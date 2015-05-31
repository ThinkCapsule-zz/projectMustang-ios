//
//  ViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "MainViewController.h"
#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
 
    // sample call

    
    CDAConfiguration* config = [CDAConfiguration defaultConfiguration];
    config.server = @"preview.contentful.com";
    CDAClient* client = [[CDAClient alloc] initWithSpaceKey:@"1oq1lgnwupsh" accessToken:@"ea40f4d68e1983a625ac5330daaaaee3befeda5a26dc4da674ccee3b5dec4037" configuration: config];
    
    [client fetchEntriesWithSuccess:^(CDAResponse *response, CDAArray *array) {
        
        NSArray* items = array.items;
        
    } failure:^(CDAResponse *response, NSError *error) {
        NSLog(@"somethings wrong");
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
