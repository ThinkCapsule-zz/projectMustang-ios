//
//  ViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "MainViewController.h"
#import "DataFetcher.h"

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
    DataFetcher* dataFetcher = [DataFetcher singletonInstance];
    
    [[dataFetcher fetchClient] fetchEntriesWithSuccess:^(CDAResponse *response, CDAArray *array) {
        
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
