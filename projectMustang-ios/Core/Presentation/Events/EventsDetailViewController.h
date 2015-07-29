//
//  EventsDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsDetailViewController : UIViewController

@property (nonatomic) UIImageView   *photoImage;
@property (nonatomic) UIImageView   *locIcon;
@property (nonatomic) UITextView       *locInfo;
@property (nonatomic) UIImageView   *dateIcon;
@property (nonatomic) UITextView       *dateInfo;

@property (nonatomic) UITextView    *eventOrganizers;
@property (nonatomic) UITextView    *eventDeets;
@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;

@property (nonatomic) NSString *eventName;
@property (nonatomic) NSString *eventDetails;

@property (nonatomic) NSString *organizerDeets;
-(void) setupViews;
-(void) setupHorizontalSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;
-(void) setupLabels;
-(void) setupImage;

@end
