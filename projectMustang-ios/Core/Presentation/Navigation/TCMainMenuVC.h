//
//  TCMainMenuVC.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCNavigationStatics.h"
#import "RESideMenu.h"

@interface TCMainMenuVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* menuItemsTable;
@property (nonatomic, strong) NSArray* menuItems;

@end
