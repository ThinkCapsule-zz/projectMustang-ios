//
//  ArticlesDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticlesDetailViewController.h"

@interface ArticlesDetailViewController ()

@end

@implementation ArticlesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    /* Why can't I override the UI NavBar appearance?
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    NSDictionary *attributes = @{
                                 NSUnderlineStyleAttributeName: @1,
                                 NSForegroundColorAttributeName : [UIColor redColor],
                                 NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:19]
                                 };
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
     */
    
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
