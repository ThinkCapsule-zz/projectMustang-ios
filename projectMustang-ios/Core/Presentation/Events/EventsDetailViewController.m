//
//  EventsDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "EventsDetailViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface EventsDetailViewController ()
@end

@implementation EventsDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.eventName = @"NOT ANOTHER LAME EVENT";
    self.title = self.eventName;
    
    self.scr_view = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.scr_view];
    
    [self setupDetails];
    [self setupMainFrames];
    [self setupInteriorInfoFrames];
    [self setupViewAreaAttr];
    [self setupTextAttr];
    [self setupImageAttr];
    [self adjustScrView];
}

- (void)setupDetails
{
    self.photoImage         = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Eve"]];
    self.locIcon            = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loc_img"]];
    self.dateIcon           = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"date_img"]];
    self.eventTypeIcon      = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eventType_img"]];
    self.restrictionsIcon   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"restrictions_img"]];
    self.distanceIcon       = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"distance_img"]];
    self.attendeesIcon      = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"attending_img"]];

    self.notifBar        = [[UILabel alloc] init];
    self.notifBar.text   = @"82 people are attending";
    
    self.eventDetails       = [[UITextView alloc] init];
    self.eventDetails.text  = @"something nice about the event and stuffffffffffffff  Hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hbecauseippopotamusxxxxx done";
    self.locInfo        = [[UITextView alloc] init];
    self.locInfo.text   = @"location info\n123 whoknows way\nBR,ON";
    
    self.dateInfo       = [[UITextView alloc] init];
    self.dateInfo.text  = @"July 24-26\n7:00AM-2:00PM";
    
    self.eventType      = [[UITextView alloc] init];
    self.eventType.text = @"Private Party";
    
    self.restrictions       = [[UITextView alloc] init];
    self.restrictions.text  = @"Restrictions";
    
    self.distance       = [[UITextView alloc] init];
    self.distance.text  = @"25 Minutes away";
    
    self.attendees      = [[UITextView alloc] init];
    self.attendees.text = @"25 people attending";
}

-(void) setupMainFrames
{
    CGFloat photosize       = 250.0;
    self.margin1            = 10.0;
    CGFloat viewWidth       = self.view.frame.size.width;
    CGFloat areaBlockWidths = self.view.frame.size.width/2-3.0;
    CGFloat areaHeights     = 60.0;
    
    self.photoImage.frame   = CGRectMake(0.0, 0.0, viewWidth, photosize);
    
    self.eventDetails.frame = CGRectMake(self.margin1, self.photoImage.frame.size.height, viewWidth-self.margin1, 300.0);
    CGFloat fixedWidth      = self.eventDetails.frame.size.width;
    CGSize newDetailSize    = [self.eventDetails sizeThatFits:CGSizeMake(fixedWidth, INFINITY)];
    CGRect newFrame         = CGRectMake(self.margin1,  self.photoImage.frame.size.height+30.0, fixedWidth, newDetailSize.height);
    newFrame.size           = CGSizeMake(fmaxf(newDetailSize.width, fixedWidth), newDetailSize.height);
    self.eventDetails.frame = newFrame;
    
    
    self.locationViewArea   = [[UIView alloc] initWithFrame:CGRectMake(2.0,
                                                                       self.eventDetails.frame.origin.y+self.eventDetails.frame.size.height,
                                                                       areaBlockWidths,
                                                                       areaHeights)];
    self.dateArea           = [[UIView alloc] initWithFrame:CGRectMake(areaBlockWidths+4.0,
                                                                       self.eventDetails.frame.origin.y+self.eventDetails.frame.size.height,
                                                                       areaBlockWidths,
                                                                       areaHeights)];
    self.eventTypeViewArea   = [[UIView alloc] initWithFrame:CGRectMake(2.0,
                                                                        self.locationViewArea.frame.origin.y+self.locationViewArea.frame.size.height+2.0,
                                                                        areaBlockWidths,
                                                                        areaHeights)];
    self.RestrictionsViewArea  = [[UIView alloc] initWithFrame:CGRectMake(areaBlockWidths+4.0,
                                                                          self.locationViewArea.frame.origin.y+self.locationViewArea.frame.size.height+2.0,
                                                                          areaBlockWidths,
                                                                          areaHeights)];
    self.distanceViewArea   = [[UIView alloc] initWithFrame:CGRectMake(2.0,
                                                                       self.eventTypeViewArea.frame.origin.y+self.eventTypeViewArea.frame.size.height+2.0,
                                                                       areaBlockWidths,
                                                                       areaHeights)];
    self.attendeesViewArea  = [[UIView alloc] initWithFrame:CGRectMake(areaBlockWidths+4.0,
                                                                       self.eventTypeViewArea.frame.origin.y+self.eventTypeViewArea.frame.size.height+2.0,
                                                                       areaBlockWidths,
                                                                       areaHeights)];
    
    [self.scr_view addSubview:self.photoImage];
    [self.scr_view addSubview:self.eventDetails];
    [self.scr_view addSubview:self.locationViewArea];
    [self.scr_view addSubview:self.dateArea];
    [self.scr_view addSubview:self.eventTypeViewArea];
    [self.scr_view addSubview:self.RestrictionsViewArea];
    [self.scr_view addSubview:self.distanceViewArea];
    [self.scr_view addSubview:self.attendeesViewArea];
}

-(void) setupInteriorInfoFrames
{
    CGFloat iconSizes       = 30.0;
    CGFloat detailSizes     = (self.view.frame.size.width/2)-iconSizes-self.margin1;
    CGFloat blockHeights    = self.locationViewArea.frame.size.height;

    self.locIcon.frame      = CGRectMake(self.margin1,
                                         (blockHeights-iconSizes)/2,
                                         iconSizes,
                                         iconSizes);
    self.locInfo.frame      = CGRectMake(self.margin1+iconSizes,
                                         (blockHeights-iconSizes)/2,
                                         detailSizes,
                                         iconSizes);
    
    self.dateIcon.frame     = CGRectMake(self.margin1,
                                         (blockHeights-iconSizes)/2,
                                         iconSizes,
                                         iconSizes);
    self.dateInfo.frame     = CGRectMake(self.margin1+iconSizes,
                                         (blockHeights-iconSizes)/2,
                                         detailSizes,
                                         iconSizes);
    
    self.eventTypeIcon.frame= CGRectMake(self.margin1,
                                         (blockHeights-iconSizes)/2,
                                         iconSizes,
                                         iconSizes);
    self.eventType.frame    = CGRectMake(self.margin1+self.locIcon.frame.size.width,
                                         (blockHeights-iconSizes)/2,
                                         detailSizes,
                                         iconSizes);
    
    self.restrictionsIcon.frame = CGRectMake(self.margin1,
                                             blockHeights/2-iconSizes/2,
                                             iconSizes,
                                             iconSizes);
    self.restrictions.frame = CGRectMake(self.margin1+iconSizes,
                                         (blockHeights-iconSizes)/2,
                                         detailSizes,
                                         iconSizes);
    
    self.distanceIcon.frame = CGRectMake(self.margin1,
                                         blockHeights/2-iconSizes/2,
                                         iconSizes,
                                         iconSizes);
    self.distance.frame     = CGRectMake(self.margin1+iconSizes,
                                         (blockHeights-iconSizes)/2,
                                         detailSizes,
                                         iconSizes);
    
    self.attendeesIcon.frame= CGRectMake(self.margin1,
                                         (blockHeights-iconSizes)/2,
                                         iconSizes,
                                         iconSizes);
    self.attendees.frame    = CGRectMake(self.margin1+iconSizes,
                                         (blockHeights-iconSizes)/2,
                                         detailSizes,
                                         iconSizes);
    
    [self.locationViewArea addSubview:self.locIcon];
    [self.locationViewArea addSubview:self.locInfo];
    [self.dateArea addSubview:self.dateIcon];
    [self.dateArea addSubview:self.dateInfo];
    [self.eventTypeViewArea addSubview:self.eventType];
    [self.eventTypeViewArea addSubview:self.eventTypeIcon];
    [self.RestrictionsViewArea addSubview:self.restrictionsIcon];
    [self.RestrictionsViewArea addSubview:self.restrictions];
    [self.distanceViewArea addSubview:self.distanceIcon];
    [self.distanceViewArea addSubview:self.distance];
    [self.attendeesViewArea addSubview:self.attendeesIcon];
    [self.attendeesViewArea addSubview:self.attendees];
}

#pragma appearance/attribute methods

-(void) setupViewAreaAttr
{
    self.locationViewArea.backgroundColor   = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.01];
    self.dateArea.backgroundColor           = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.01];
    self.eventTypeViewArea.backgroundColor  = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.01];
    self.RestrictionsViewArea.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.01];
    self.distanceViewArea.backgroundColor   = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.01];
    self.attendeesViewArea.backgroundColor  = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.01];
}

-(void) setupTextAttr
{
    self.eventDetails.textAlignment     = NSTextAlignmentLeft;
    self.eventDetails.font              = [UIFont fontWithName:@"Avenir-Light" size:11];
    self.eventDetails.editable          = NO;
    self.eventDetails.scrollEnabled     = NO;
    self.eventDetails.textColor         = [UIColor darkGrayColor];

    self.locInfo.textAlignment  = NSTextAlignmentLeft;
    self.locInfo.font           = [UIFont fontWithName:@"Avenir" size:11 ];
    self.locInfo.textColor      = [UIColor darkGrayColor];
    self.locInfo.scrollEnabled  = NO;
    self.locInfo.editable       = NO;
    self.locInfo.backgroundColor= nil;


    self.dateInfo.textAlignment     = NSTextAlignmentLeft;
    self.dateInfo.font              = [UIFont fontWithName:@"Avenir" size:11];
    self.dateInfo.textColor         = [UIColor darkGrayColor];
    self.dateInfo.scrollEnabled     = NO;
    self.dateInfo.editable          = NO;
    self.dateInfo.backgroundColor   = nil;

    self.eventType.textAlignment    = NSTextAlignmentLeft;
    self.eventType.font             = [UIFont fontWithName:@"Avenir" size:11 ];
    self.eventType.textColor        = [UIColor darkGrayColor];
    self.eventType.editable         = NO;
    self.eventType.scrollEnabled    = NO;
    self.eventType.backgroundColor  = nil;

    self.restrictions.textAlignment     = NSTextAlignmentLeft;
    self.restrictions.font              = [UIFont fontWithName:@"Avenir" size:11 ];
    self.restrictions.textColor         = [UIColor darkGrayColor];
    self.restrictions.editable          = NO;
    self.restrictions.scrollEnabled     = NO;
    self.restrictions.backgroundColor   = nil;

    self.distance.textAlignment     = NSTextAlignmentLeft;
    self.distance.font              = [UIFont fontWithName:@"Avenir" size:11 ];
    self.distance.textColor         = [UIColor darkGrayColor];
    self.distance.editable          = NO;
    self.distance.scrollEnabled     = NO;
    self.distance.backgroundColor   = nil;

    self.attendees.textAlignment    = NSTextAlignmentLeft;
    self.attendees.font             = [UIFont fontWithName:@"Avenir" size:11 ];
    self.attendees.textColor        = [UIColor darkGrayColor];
    self.attendees.editable         = NO;
    self.attendees.scrollEnabled    = NO;
    self.attendees.backgroundColor  = nil;
}

-(void) setupImageAttr
{
    self.photoImage.contentMode  = UIViewContentModeScaleAspectFill;
    self.photoImage.clipsToBounds= YES;
    
    self.locIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.locIcon.clipsToBounds   = YES;

    self.dateIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.dateIcon.clipsToBounds   = YES;
    
    self.eventTypeIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.eventTypeIcon.clipsToBounds   = YES;
    
    self.restrictionsIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.restrictionsIcon.clipsToBounds   = YES;
    
    self.distanceIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.distanceIcon.clipsToBounds   = YES;
    
    self.attendeesIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.attendeesIcon.clipsToBounds   = YES;
}

-(void) adjustScrView
{
    [self.scr_view setContentSize:CGSizeMake(self.view.frame.size.width, self.distanceViewArea.frame.origin.y+self.distanceViewArea.frame.size.height*2+8.0)];
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
