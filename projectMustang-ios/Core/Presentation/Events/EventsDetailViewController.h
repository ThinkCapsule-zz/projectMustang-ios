//
//  EventsDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDataModel.h"
#import "RestrictionsTableViewController.h"

@interface EventsDetailViewController : UIViewController

@property (nonatomic,strong) UIScrollView  *scr_view;
@property (nonatomic) UIImageView   *photoImage;
@property (nonatomic) UITextView    *eventDetails;
@property (nonatomic) UIImageView   *locIcon;
@property (nonatomic) UIButton      *locInfo;
@property (nonatomic) UIImageView   *dateIcon;
@property (nonatomic) UIButton      *dateInfo;
@property (nonatomic) UIImageView   *eventTypeIcon;
@property (nonatomic) UIButton      *eventType;
@property (nonatomic) UIImageView   *restrictionsIcon;
@property (nonatomic) UIButton      *restrictions;
@property (nonatomic) UIImageView   *distanceIcon;
@property (nonatomic) UIButton      *distance;
@property (nonatomic) UIImageView   *attendeesIcon;
@property (nonatomic) UIButton      *attendees;
@property (nonatomic) UILabel       *notifBar;
@property (nonatomic) UIButton      *locationViewArea;
@property (nonatomic) UIButton      *dateArea;
@property (nonatomic) UIButton      *eventTypeViewArea;
@property (nonatomic) UIButton      *RestrictionsViewArea;
@property (nonatomic) UIButton      *distanceViewArea;
@property (nonatomic) UIButton      *attendeesViewArea;
@property (nonatomic) UIImageView   *host;
@property (nonatomic) UITapGestureRecognizer *tap;
@property (nonatomic) CGFloat       margin1;
@property (nonatomic) NSString      *eventName;
@property (nonatomic) EventDataModel *dataModel;
-(id) initWithData:(EventDataModel *)data;
-(void) setupDetails;
-(void) setupMainFrames;
-(void) setupInteriorInfoFrames;
-(void) setupViewAreaAttr;
-(void) setupTextAttr;
-(void) setupImageAttr;
-(void) adjustScrView;
@end
