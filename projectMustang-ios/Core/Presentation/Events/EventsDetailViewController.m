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
    
    [self setupViews];
    [self setupSpacing];
    [self setupSizeConstraints];
    [self setupPOSConstraints];
    [self setupText];
    [self setupImages];
}

- (void)setupViews
{
    self.photoImage     = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Eve"]];
    self.locIcon        = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"locimg"]];
    self.dateIcon       = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dateimg"]];
    self.backView       = [[UIView alloc] init];

    self.locInfo        = [[UITextView alloc] init];
    self.locInfo.text   = @"location info\n123 whoknows way\nBR,ON";
    
    self.dateInfo       = [[UITextView alloc] init];
    self.dateInfo.text  = @"July 24-26\n7:00AM-2:00PM";
    
    self.timeBar        = [[UILabel alloc] init];
    self.timeBar.text   = @"The event will start in 15 minutes";

    
    //Event Details
    
    self.eventDeets     = [[UITextView alloc] init];
    self.eventName      = @"EVENT NAME";
    self.eventDetails   = @"something nice about the event and stuffffffffffffff  Hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hbecauseippopotamusxxxxx done ";
    NSString                    *hi = [NSString stringWithFormat:@"%@\n%@", self.eventName, self.eventDetails];
    NSMutableAttributedString *deet = [[NSMutableAttributedString alloc] initWithString:hi];
    [deet addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier New" size:25.0] range:NSMakeRange(0,self.eventName.length)];
    [deet addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir-Roman" size:12.0] range:[hi rangeOfString:self.eventDetails]];
    [deet addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xFF5722) range:[hi rangeOfString:self.eventDetails]];
    self.eventDeets.attributedText  = deet;
    
    
    //Event Organizers
    
    self.eventOrganizers    = [[UITextView alloc] init];
    self.organizerDeets     = @"these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! ";
    NSString                    *hihi   = [NSString stringWithFormat:@"ORGANIZERS\n%@", self.organizerDeets];
    NSMutableAttributedString   *deet2  = [[NSMutableAttributedString alloc] initWithString:hihi];
    [deet2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier New" size:25.0 ] range:NSMakeRange(0,10)];
    [deet2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir-Roman" size:12.0] range:[hihi rangeOfString:self.organizerDeets]];
    [deet2 addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xFF5722) range:[hihi rangeOfString:self.organizerDeets]];
    self.eventOrganizers.attributedText = deet2;
    
    self.backView.translatesAutoresizingMaskIntoConstraints         = NO;
    self.photoImage.translatesAutoresizingMaskIntoConstraints       = NO;
    self.locIcon.translatesAutoresizingMaskIntoConstraints          = NO;
    self.locInfo.translatesAutoresizingMaskIntoConstraints          = NO;
    self.dateIcon.translatesAutoresizingMaskIntoConstraints         = NO;
    self.dateInfo.translatesAutoresizingMaskIntoConstraints         = NO;
    self.eventDeets.translatesAutoresizingMaskIntoConstraints       = NO;
    self.eventOrganizers.translatesAutoresizingMaskIntoConstraints  = NO;
    self.timeBar.translatesAutoresizingMaskIntoConstraints  = NO;
    
    [self.view addSubview:self.backView];
    [self.view addSubview:self.photoImage];
    [self.view addSubview:self.locIcon];
    [self.view addSubview:self.locInfo];
    [self.view addSubview:self.dateIcon];
    [self.view addSubview:self.dateInfo];
    [self.view addSubview:self.eventDeets];
    [self.view addSubview:self.eventOrganizers];
    [self.view addSubview:self.timeBar];
}

-(void) setupSpacing
{
    self.viewsDictionary = @{@"locIcon": self.locIcon,
                             @"locInfo": self.locInfo,
                             @"dateIcon": self.dateIcon,
                             @"dateInfo": self.dateInfo,
                             @"backView": self.backView,
                             @"eventOrganizers": self.eventOrganizers,
                             @"eventDeets": self.eventDeets,
                             @"photoImage": self.photoImage};
    
    self.metrics = @{@"vSpacing":@64,
                     @"hSpacing":@15,
                     @"hSpacing1":@0,
                     @"photoSize":@151};
    
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[photoImage(photoSize)]-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[locIcon(28)]-[locInfo(154)]-[dateIcon(30)]-[dateInfo(115)]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[eventOrganizers]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[eventDeets]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing1-[photoImage]-hSpacing1-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H1];
    [self.view addConstraints:constraint_POS_H2];
    [self.view addConstraints:constraint_POS_H3];
    [self.view addConstraints:constraint_POS_H4];
}

-(void) setupSizeConstraints
{
    
    //location info
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.locIcon
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.6
                              constant:0.0]];
    
     //backview
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.backView
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.6
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.backView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //dates
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.dateIcon
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.locIcon
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];
    //bottom bar
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.timeBar
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.timeBar
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.05
                              constant:0.0]];
    
}

-(void) setupPOSConstraints
{
    //back view
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.backView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    //loaction icon
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.locIcon
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];

    //loaction info
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.locInfo
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.locIcon
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1.0
                              constant:0.0]];
    
    //date icon
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.dateIcon
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //date info
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.dateInfo
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.locIcon
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1.0
                              constant:0.0]];
    
    //event info
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.eventDeets
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.locIcon
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:20.0]];
    //organizers
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.eventOrganizers
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.eventDeets
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:1.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.timeBar
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:1.0]];
}


#pragma populating and appearance methods

-(void) setupText
{
    self.backView.backgroundColor   = [UIColor colorWithRed:0.0 green:0.1 blue:0.1 alpha:0.025];
    
    self.locInfo.textAlignment  = NSTextAlignmentLeft;
    self.locInfo.font           = [UIFont fontWithName:@"AvenirNext-Medium" size:12 ];
    self.locInfo.textColor      = UIColorFromRGB(0x3f3f3f);
    self.locInfo.scrollEnabled  = NO;
    self.locInfo.editable       = NO;
    self.locInfo.backgroundColor = nil;

    //used this to make the textview size to fit content, but since I removed scroll enabled, it's fine :)
    /*
    CGFloat fixedWidth  = self.locInfo.frame.size.width;
    CGSize newSize      = [self.locInfo sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame     = self.locInfo.frame;
    newFrame.size       = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    self.locInfo.frame  = newFrame;
    */
    
    self.dateInfo.textAlignment     = NSTextAlignmentLeft;
    self.dateInfo.font              = [UIFont fontWithName:@"Avenir-Roman" size:12];
    self.dateInfo.scrollEnabled     = NO;
    self.dateInfo.editable          = NO;
    self.dateInfo.backgroundColor   = nil;

    self.eventDeets.textAlignment   = NSTextAlignmentLeft;
    self.eventDeets.editable        = NO;
    self.eventDeets.scrollEnabled   = NO;
    self.eventDeets.backgroundColor = [UIColor colorWithRed:0.1 green:0.0 blue:0.0 alpha:0.025];

    self.eventOrganizers.textAlignment  = NSTextAlignmentLeft;
    self.eventOrganizers.editable       = NO;
    self.eventOrganizers.scrollEnabled  = NO;
    self.eventOrganizers.backgroundColor= [UIColor colorWithRed:0.0 green:0.1 blue:0.0 alpha:0.025];

    self.timeBar.backgroundColor    = UIColorFromRGB(0xFF5722);
    self.timeBar.textColor      = [UIColor whiteColor];
    self.timeBar.font               = [UIFont fontWithName:@"Avenir-Roman" size:13];
    self.timeBar.textAlignment      = NSTextAlignmentCenter;


}

-(void) setupImages
{
    self.photoImage.contentMode  = UIViewContentModeScaleAspectFill;
    self.photoImage.clipsToBounds= YES;
    
    self.locIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.locIcon.clipsToBounds   = YES;

    self.dateIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.dateIcon.clipsToBounds   = YES;
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
