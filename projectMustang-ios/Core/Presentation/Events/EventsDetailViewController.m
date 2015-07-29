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
    [self setupHorizontalSpacing];
    [self setupSizeConstraints];
    [self setupPOSConstraints];
    [self setupLabels];
    [self setupImage];

}


- (void)setupViews
{
    self.photoImage                 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Eve"]];
    self.locIcon                    = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"locimg"]];
    self.dateIcon                   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dateimg"]];

    self.locInfo                    = [[UITextView alloc] init];
    self.locInfo.text               = @"location info\n123 whoknows way\nBR,ON";
    self.locInfo.backgroundColor    = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
    
    self.dateInfo                   = [[UITextView alloc] init];
    self.dateInfo.text              = @"July 24-26\n7:00AM-2:00PM";
    self.dateInfo.backgroundColor   = [UIColor purpleColor];
    
    self.eventDeets                 = [[UITextView alloc] init];
    self.eventName                  =@"EVENT NAME";
    self.eventDetails               =@"something nice about the event and stuffffffffffffff because Hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamus hippopotamusxxxxx done ";
    
    NSString *hi                    = [NSString stringWithFormat:@"%@\n%@", self.eventName, self.eventDetails];
    NSMutableAttributedString *deet = [[NSMutableAttributedString alloc  ] initWithString:hi];
    [deet addAttribute:NSFontAttributeName
                 value:[UIFont fontWithName:@"Courier New" size:25.0 ]
                 range:NSMakeRange(0,self.eventName.length)];
    [deet addAttribute:NSForegroundColorAttributeName
                    value:UIColorFromRGB(0xFF5722)
                    range:[hi rangeOfString:self.eventDetails]];
    self.eventDeets.attributedText  = deet;
    self.eventDeets.backgroundColor = [UIColor colorWithRed:0.2 green:0.0 blue:0.0 alpha:0.1];
    
    
    self.eventOrganizers    = [[UITextView alloc] init];
    self.organizerDeets     = @"these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! these organizers helped with everything from lalallala to lallalala, all the way from LALALLA! ";
    
    NSString *hihi                      = [NSString stringWithFormat:@"ORGANIZERS\n%@", self.organizerDeets];
    NSMutableAttributedString *deet2    = [[NSMutableAttributedString alloc  ] initWithString:hihi];
    [deet2 addAttribute:NSFontAttributeName
                 value:[UIFont fontWithName:@"Courier New" size:25.0 ]
                 range:NSMakeRange(0,10)];
    [deet2 addAttribute:NSForegroundColorAttributeName
                 value:UIColorFromRGB(0xFF5722)
                 range:[hi rangeOfString:self.organizerDeets]];
    self.eventOrganizers.attributedText     = deet2;
    self.eventOrganizers.backgroundColor    = [UIColor colorWithRed:0.0 green:0.2 blue:0.0 alpha:0.1];
    

    
    self.photoImage.translatesAutoresizingMaskIntoConstraints       = NO;
    self.locIcon.translatesAutoresizingMaskIntoConstraints          = NO;
    self.locInfo.translatesAutoresizingMaskIntoConstraints          = NO;
    self.dateIcon.translatesAutoresizingMaskIntoConstraints         = NO;
    self.dateInfo.translatesAutoresizingMaskIntoConstraints         = NO;
    self.eventDeets.translatesAutoresizingMaskIntoConstraints       = NO;
    self.eventOrganizers.translatesAutoresizingMaskIntoConstraints  = NO;
    
    
    [self.view addSubview:self.photoImage];
    [self.view addSubview:self.locIcon];
    [self.view addSubview:self.locInfo];
    [self.view addSubview:self.dateIcon];
    [self.view addSubview:self.dateInfo];
    [self.view addSubview:self.eventDeets];
    [self.view addSubview:self.eventOrganizers];
    
    self.viewsDictionary = @{@"locIcon": self.locIcon,
                             @"locInfo": self.locInfo,
                             @"dateIcon": self.dateIcon,
                             @"dateInfo": self.dateInfo,
                             @"eventOrganizers": self.eventOrganizers,
                             @"eventDeets": self.eventDeets,
                             @"photoImage": self.photoImage};
    
    self.metrics = @{@"vSpacing":@64,
                     @"hSpacing":@15,
                     @"hSpacing1":@0,
                     @"photoSize":@151};
}

-(void) setupHorizontalSpacing
{
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[photoImage(photoSize)]-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[locIcon(28)]-[locInfo(154)]-[dateIcon(30)]-[dateInfo(115)]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[eventOrganizers]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[eventDeets]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing1-[photoImage]-hSpacing1-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
    [self.view addConstraints:constraint_POS_H1];
    [self.view addConstraints:constraint_POS_H2];
    [self.view addConstraints:constraint_POS_H3];
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
    //location info
    /*
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.locInfo
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.locIcon
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:1.0]];

    */
    //dates
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.dateIcon
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.locIcon
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.dateInfo
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.locIcon
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];
    
     //event deets

    /*[self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.eventDeets
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];
    //event Organizers

    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.eventOrganizers
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.eventDeets
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];*/
}

-(void) setupPOSConstraints
{
    //loaction info
    
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
                              constant:1.0]];
    //organizers
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.eventOrganizers
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.eventDeets
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:1.0]];
}


#pragma populating and appearance methods

-(void) setupLabels
{
    self.locInfo.textAlignment  = NSTextAlignmentLeft;
    self.locInfo.font           = [UIFont fontWithName:@"AvenirNext-Medium" size:12 ];
    self.locInfo.textColor      = UIColorFromRGB(0x3f3f3f);
    self.locInfo.scrollEnabled  = NO;
    self.locInfo.editable       = NO;
    CGFloat fixedWidth  = self.locInfo.frame.size.width;
    CGSize newSize      = [self.locInfo sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame     = self.locInfo.frame;
    newFrame.size       = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    self.locInfo.frame  = newFrame;

    
    self.dateInfo.textAlignment = NSTextAlignmentLeft;
    self.dateInfo.font          = [UIFont fontWithName:@"Avenir-Roman" size:12];
    self.dateInfo.editable      = NO;
    //*************************       WHY DOES THIS MAKE IT DISAPPEAR, THOUGH IT IS NOT A PROBLEM FOR THE locInfo TEXT ABOVE?
    /*
    CGFloat fixedWidth1 = self.dateInfo.frame.size.width;
    CGSize newSize1     = [self.dateInfo sizeThatFits:CGSizeMake(fixedWidth1, MAXFLOAT)];
    CGRect newFrame1    = self.dateInfo.frame;
    newFrame1.size      = CGSizeMake(fmaxf(newSize1.width, fixedWidth1), newSize1.height);
    self.dateInfo.frame  = newFrame1;
    */
    
    
    self.eventDeets.textAlignment   = NSTextAlignmentLeft;
    self.eventDeets.font            = [UIFont fontWithName:@"Avenir-Roman" size:12 ];
    self.eventDeets.editable        = NO;
    self.eventDeets.scrollEnabled   = NO;
    CGFloat fixedWidth2 = self.eventDeets.frame.size.width;
    CGSize newSize2     = [self.eventDeets sizeThatFits:CGSizeMake(fixedWidth2, MAXFLOAT)];
    CGRect newFrame2    = self.eventDeets.frame;
    newFrame2.size      = CGSizeMake(fmaxf(newSize2.width, fixedWidth2), newSize2.height);
    self.eventDeets.frame  = newFrame2;
    
    
    self.eventOrganizers.textAlignment  = NSTextAlignmentLeft;
    self.eventOrganizers.font           = [UIFont fontWithName:@"Avenir-Roman" size:12 ];
    self.eventOrganizers.textColor      = [UIColor blackColor];
    self.eventOrganizers.editable       = NO;
    self.eventOrganizers.scrollEnabled  = NO;
    CGFloat fixedWidth3 = self.eventOrganizers.frame.size.width;
    CGSize newSize3     = [self.eventOrganizers sizeThatFits:CGSizeMake(fixedWidth3, MAXFLOAT)];
    CGRect newFrame3    = self.eventOrganizers.frame;
    newFrame3.size      = CGSizeMake(fmaxf(newSize3.width, fixedWidth3), newSize3.height);
    self.eventOrganizers.frame = newFrame3;
}

-(void) setupImage
{
    self.photoImage.contentMode     = UIViewContentModeScaleAspectFill;
    self.photoImage.clipsToBounds   = YES;
    //    [self addSubview:self.photoImageView];
    
    self.locIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.locIcon.clipsToBounds   = YES;
    [self.locIcon setAlpha:0.9];

    self.dateIcon.contentMode     = UIViewContentModeScaleAspectFit;
    self.dateIcon.clipsToBounds   = YES;
    [self.dateIcon setAlpha:0.9];
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
