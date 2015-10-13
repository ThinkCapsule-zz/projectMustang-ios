//
//  RestrictionsTableViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-09-15.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "RestrictionsTableViewController.h"
@interface RestrictionsTableViewController ()
@end

@implementation RestrictionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Event Restrictions";
    
    //why wont the title be removed after I place nil or @" " for the initwithtitle?
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:nil
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)loadView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    [tableView reloadData];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.view = tableView;
}


-(id) initWithRestrictions:(NSArray *)restrictionsData
{
    if (restrictionsData !=NULL){
        self.restrictions = restrictionsData;
    }
    else {
        self.restrictions = [[NSArray alloc] initWithObjects:(NSString*) @"No Restrictions ;)", nil];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of restrictions
    return self.restrictions.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //space between cells
    return 7.0;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //configure cell
    
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:MyIdentifier];
    cell.textLabel.text             = self.restrictions[indexPath.section];
    
    //having trouble trying to figureout ohow to make the background of the table white, while cells remain the light gray color
    cell.backgroundColor  = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.01];
    
    cell.textLabel.textColor        = [UIColor grayColor];
    cell.textLabel.font             = [UIFont fontWithName:@"Avenir-Light" size:16];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

    
@end

