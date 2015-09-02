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
@property (nonatomic) UITextView    *eventDetails;
@property (nonatomic) UIImageView   *locIcon;
@property (nonatomic) UITextView    *locInfo;
@property (nonatomic) UIImageView   *dateIcon;
@property (nonatomic) UITextView    *dateInfo;
@property (nonatomic) UIImageView   *eventTypeIcon;
@property (nonatomic) UITextView    *eventType;
@property (nonatomic) UIImageView   *restrictionsIcon;
@property (nonatomic) UITextView    *restrictions;
@property (nonatomic) UIImageView   *distanceIcon;
@property (nonatomic) UITextView    *distance;
@property (nonatomic) UIImageView   *attendeesIcon;
@property (nonatomic) UITextView    *attendees;
@property (nonatomic) UILabel       *notifBar;
@property (nonatomic) UIView        *locationViewArea;
@property (nonatomic) UIView        *dateArea;
@property (nonatomic) UIView        *eventTypeViewArea;
@property (nonatomic) UIView        *RestrictionsViewArea;
@property (nonatomic) UIView        *distanceViewArea;
@property (nonatomic) UIView        *attendeesViewArea;

@property (nonatomic) NSString *eventName;

-(void) setupViews;
-(void) setupFrames;
-(void) setupText;
-(void) setupImages;

@end
