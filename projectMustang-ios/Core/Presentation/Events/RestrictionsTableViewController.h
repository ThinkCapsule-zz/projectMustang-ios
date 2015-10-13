//
//  RestrictionsTableViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-09-15.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestrictionsTableViewController : UITableViewController

@property (nonatomic, strong) UITableView       *RestrictionsCollectionView;
@property (nonatomic, strong) NSString          *sourcePath;
@property (nonatomic, strong) NSArray           *restrictions;
@property (nonatomic, strong) NSMutableArray    *temp;
-(id) initWithRestrictions: (NSArray*)          restrictionsData;
@end
