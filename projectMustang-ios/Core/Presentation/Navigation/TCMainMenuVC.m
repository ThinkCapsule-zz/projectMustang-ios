//
//  TCMainMenuVC.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "TCMainMenuVC.h"
#import "ConfigManager.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface TCMainMenuVC ()

@end

@implementation TCMainMenuVC


- (void)viewDidLoad {
    
    [super viewDidLoad];

    ConfigManager* configManager         = [ConfigManager singletonInstance];
    self.menuItems                       = [configManager navigationItems];
    self.menuItemsTable                  = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f,
                                                                                         self.view.frame.size.width, 54 * 5)
                                                                        style:UITableViewStylePlain];
    self.menuItemsTable.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    self.menuItemsTable.delegate         = self;
    self.menuItemsTable.dataSource       = self;
    self.menuItemsTable.opaque           = NO;
    self.menuItemsTable.backgroundColor  = [UIColor clearColor];
    self.menuItemsTable.backgroundView   = nil;
    self.menuItemsTable.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.menuItemsTable.bounces          = YES;
    self.view.backgroundColor            = UIColorFromRGB(0x663366);

    [self.view addSubview: self.menuItemsTable];
    
    // delegates
    self.menuItemsTable.dataSource = self;
    self.menuItemsTable.delegate   = self;
    
}

#pragma mark - TableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case kArticleSection:
            NSLog(@"article section");
            break;
        case kBlogSection:
            NSLog(@"blog section");
            break;
        case kVideosSection:
            NSLog(@"videos section");
            break;
        case kPlacesSection:
            NSLog(@"places section");
            break;
        case kEventsSection:
            NSLog(@"events section");
            break;
        default:
            break;
    }
    
    [self.sideMenuViewController hideMenuViewController];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

#pragma mark - TableViewDataDelegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.menuItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* cellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    cell.textLabel.text = self.menuItems[indexPath.row];
    
    return cell;
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
