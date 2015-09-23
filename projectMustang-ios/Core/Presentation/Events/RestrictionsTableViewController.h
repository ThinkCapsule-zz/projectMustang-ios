//
//  RestrictionsTableViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-09-15.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestrictionsTableViewController : UITableViewController

@property (nonatomic) UICollectionViewFlowLayout *restrictionsFlowLayout;
@property (nonatomic) NSArray *restrictions;
-(void) initWithRestrictions: (NSArray *) restrictionsData;
@end
