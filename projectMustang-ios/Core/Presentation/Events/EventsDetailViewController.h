//
//  EventsDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsDetailViewController : UIViewController

@property (nonatomic) UILabel       *eventName;
@property (nonatomic) UILabel       *hostName;
@property (nonatomic) UILabel       *photoSource;
@property (nonatomic) UITextView    *eventDeets;
@property (nonatomic) UIImageView   *photoImage;
@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;

-(void) setupViews;
-(void) setupHorizontalSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;


@end
