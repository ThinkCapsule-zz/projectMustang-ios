//
//  TCMainMenuVC.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ConfigManager.h"
#import "NavigationManager.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

CGFloat const kLeftNavHeight = 340.0f;

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];

    ConfigManager* configManager         = [ConfigManager singletonInstance];
    self.menuItems                       = [configManager navigationItems];
    self.menuItemsTable                  = [[UITableView alloc] initWithFrame:CGRectMake(20, (self.view.frame.size.height - kLeftNavHeight) / 2.0f,
                                                                                         self.view.frame.size.width, kLeftNavHeight)
                                                                        style:UITableViewStylePlain];
    self.view.backgroundColor        = [UIColor whiteColor];
    // Menu Items
    self.menuItemsTable.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    self.menuItemsTable.delegate         = self;
    self.menuItemsTable.dataSource       = self;
    self.menuItemsTable.opaque           = NO;
    self.menuItemsTable.backgroundColor  = [UIColor clearColor];
    self.menuItemsTable.backgroundView   = nil;
    self.menuItemsTable.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.menuItemsTable.bounces          = YES;
    [self.view addSubview: self.menuItemsTable];
    
    // Settings button
    UIImage* pref_icon_image = [UIImage imageNamed:@"pref_icon"];
    UIButton* btnPreferences = [[UIButton alloc] initWithFrame:CGRectMake(self.menuItemsTable.frame.origin.x, self.menuItemsTable.frame.origin.y + self.menuItemsTable.frame.size.height + 30, 60, 60)];
    [btnPreferences setImage:pref_icon_image forState:UIControlStateNormal];
    
    [btnPreferences addTarget:self action:@selector(displaySettings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPreferences];
    
    // delegates
    self.menuItemsTable.dataSource = self;
    self.menuItemsTable.delegate   = self;
    
}
- (void) displaySettings {
    
    [[NavigationManager singletonInstance] goToSettings];
    [self.sideMenuViewController hideMenuViewController];
}
#pragma mark - TableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NavigationManager* navManager = [NavigationManager singletonInstance];
    
    switch (indexPath.row) {
        case kMainSection:
            [navManager goToMainSection];
            break;
        case kArticleSection:
            [navManager goToArticleSection];
            break;
        case kBlogSection:
            [navManager goToBlogSection];
            break;
        case kVideosSection:
            [navManager goToVideosSection];
            break;
        case kPlacesSection:
            [navManager goToPlacesSection];
            break;
        case kEventsSection:
            [navManager goToEventsSection];
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
        cell                                = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor                = [UIColor clearColor];
        cell.textLabel.font                 = [UIFont fontWithName:@"SourceSansPro-ExtraLight" size:21];
        cell.textLabel.textColor            = UIColorFromRGB(0xFF5722);
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView         = [[UIView alloc] init];
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
