//
//  EventsDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsDetailViewController : UIViewController

@property (nonatomic,strong) UIScrollView  *scr_view;
@property (nonatomic) UIImageView   *photoImage;
@property (nonatomic) UIImageView   *locIcon;
@property (nonatomic) UIImageView   *dateIcon;
@property (nonatomic) UITextView    *locInfo;
@property (nonatomic) UITextView    *dateInfo;
@property (nonatomic) UITextView    *eventOrganizers;
@property (nonatomic) UITextView    *eventDeets;
@property (nonatomic) UIView        *backView;
@property (nonatomic) UILabel       *timeBar;

@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;

@property (nonatomic) NSString *eventName;
@property (nonatomic) NSString *eventDetails;
@property (nonatomic) NSString *organizerDeets;

-(void) setupViews;
-(void) setupSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;
-(void) setupText;
-(void) setupImages;

@end
