//
//  PlacesDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesDetailViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface PlacesDetailViewController ()
@end

@implementation PlacesDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)setupViews
{
    
    self.photoImage     = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Nova"]];
    self.address_img    = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loc_img"]];
    self.phone_img      = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone_img"]];
    self.hours_img      = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clock_img"]];
    
    self.placeName      = [UILabel new];
    self.placeName.text = self.placeName_str;

    self.placeType      = [[UILabel alloc] init];
    self.placeType.text = self.placeType_str ;

    self.address        = [[UILabel alloc] init];
    self.address.text   = self.address_str ;

    self.phone          = [[UILabel alloc] init];
    self.phone.text     = self.phone_str ;

    self.hours          = [[UILabel alloc] init];
    self.hours.text     = self.hours_str ;

    self.rating         = [[UILabel alloc] init];
    self.rating.text    = self.rating_str ;

    self.ratings_cupsOcoffee    = [[UIImageView alloc] init];
    self.ratings_numberOf       = [[UILabel alloc] init];
    self.ratings_numberOf.text  = self.ratings_numberOf_str;

    self.About_label      = [[UILabel alloc] init];
    self.About_label.text = @"About";
    
    self.About          = [[UITextView alloc] init];
    self.About.text     = self.About_str;

    self.photoImage.translatesAutoresizingMaskIntoConstraints           = NO;
    self.placeName.translatesAutoresizingMaskIntoConstraints            = NO;
    self.placeType.translatesAutoresizingMaskIntoConstraints            = NO;
    self.address_img.translatesAutoresizingMaskIntoConstraints          = NO;
    self.address.translatesAutoresizingMaskIntoConstraints              = NO;
    self.phone_img.translatesAutoresizingMaskIntoConstraints            = NO;
    self.phone.translatesAutoresizingMaskIntoConstraints                = NO;
    self.hours_img.translatesAutoresizingMaskIntoConstraints            = NO;
    self.hours.translatesAutoresizingMaskIntoConstraints                = NO;
    self.rating.translatesAutoresizingMaskIntoConstraints               = NO;
    self.ratings_cupsOcoffee.translatesAutoresizingMaskIntoConstraints  = NO;
    self.ratings_numberOf.translatesAutoresizingMaskIntoConstraints     = NO;
    self.About_label.translatesAutoresizingMaskIntoConstraints                = NO;
    self.About.translatesAutoresizingMaskIntoConstraints                = NO;
    
    
    [self.view addSubview:self.photoImage];
    [self.view addSubview:self.placeName];
    [self.view addSubview:self.placeType];
    [self.view addSubview:self.address_img];
    [self.view addSubview:self.address];
    [self.view addSubview:self.phone_img];
    [self.view addSubview:self.phone];
    [self.view addSubview:self.hours_img];
    [self.view addSubview:self.hours];
    [self.view addSubview:self.rating];
    [self.view addSubview:self.ratings_cupsOcoffee];
    [self.view addSubview:self.ratings_numberOf];
    [self.view addSubview:self.About_label];
    [self.view addSubview:self.About];
    
    self.viewsDictionary = @{@"photoImage": self.photoImage,
                             @"placeName": self.placeName,
                             @"placeType": self.placeType,
                             @"address_img": self.address_img,
                             @"address": self.address,
                             @"phone_img": self.phone_img,
                             @"phone": self.phone,
                             @"hours_img": self.hours_img,
                             @"hours": self.hours,
                             @"rating": self.rating,
                             @"ratings_cupsOcoffee": self.ratings_cupsOcoffee,
                             @"ratings_numberOf": self.ratings_numberOf,
                             @"AboutLabel": self.About_label,
                             @"About": self.About};
    self.metrics = @{@"vSpacing":@70,
                     @"hSpacing":@15,
                     @"hSpacing1":@1,
                     @"iconsz":@23,
                     @"imageSize":@230};
    
}

-(void) setupHorizontalSpacing
{
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[photoImage(imageSize)]-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing1-[photoImage]-hSpacing1-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    
    NSArray *constraint_POS_H1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[placeName]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[placeType]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[address_img(iconsz)]-[address]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[phone_img(iconsz)]-[phone]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H5 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[hours_img(iconsz)]-[hours]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H6 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[rating]-[ratings_cupsOcoffee]-[ratings_numberOf]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H7 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[AboutLabel]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H8 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[About]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
    [self.view addConstraints:constraint_POS_H1];
    [self.view addConstraints:constraint_POS_H2];
    [self.view addConstraints:constraint_POS_H3];
    [self.view addConstraints:constraint_POS_H4];
    [self.view addConstraints:constraint_POS_H5];
    [self.view addConstraints:constraint_POS_H6];
    [self.view addConstraints:constraint_POS_H7];
    [self.view addConstraints:constraint_POS_H8];
}

-(void) setupSizeConstraints
{
    //Place Name

    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.placeName
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.2
                              constant:0.0]];

    //Place Type
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.placeType
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.placeName
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.55
                              constant:0.0]];

    //address
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.address
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.address_img
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];
    //phone
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.phone
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.phone_img
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];
    //hours
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.hours
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.hours_img
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];
    //about
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.About_label
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.hours
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0
                              constant:0.0]];

}

-(void) setupPOSConstraints
{
    //Place Name
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.placeName
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:40.0]];

    
    //place Type
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.placeType
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.placeName
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //address
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.address_img
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.placeType
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.address
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.placeType
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    //phone
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.phone_img
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.address_img
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.phone
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.address_img
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    //hours
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.hours_img
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.phone_img
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.hours
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.phone_img
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    //rating
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.rating
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.hours_img
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.ratings_cupsOcoffee
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.hours_img
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.ratings_numberOf
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.hours_img
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    //About
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.About_label
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.rating
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.About
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.About_label
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
}

-(void) loadData:(NSString*)placeName :(NSString*)placeType :(NSString*)address :(NSString*)phone :(NSString*)hours :(NSString*)rating :(NSString*)numofratings :(NSString*)about
{
    self.placeName_str        = placeName;
    self.placeType_str        = placeType;
    self.address_str          = address;
    self.phone_str            = phone;
    self.hours_str            = hours;
    self.rating_str           = rating;
    self.ratings_numberOf_str = numofratings;
    self.About_str            = about;
    
    [self setupViews];
    [self loadAppearances];
    [self setupHorizontalSpacing];
    [self setupSizeConstraints];
    [self setupPOSConstraints];
}

-(void) loadAppearances
{
    self.photoImage.backgroundColor = [UIColor blackColor];
    self.photoImage.contentMode     = UIViewContentModeScaleAspectFit;
    
    self.placeName.font             = [UIFont fontWithName:@"AmericanTypewriter" size:23 ];
    
    self.placeType.font             = [UIFont fontWithName:@"AvenirNext-MediumItalic" size:12];
    self.placeType.textColor        = UIColorFromRGB(0x7f8c8d);
    
    self.address.backgroundColor    = [UIColor yellowColor];
    self.address.font               = [UIFont fontWithName:@"Avenir-Roman" size:14.5 ];
    
    self.phone.backgroundColor      = [UIColor greenColor];
    self.phone.font                 = [UIFont fontWithName:@"Avenir-Roman" size:14.5 ];
    
    self.hours.backgroundColor      = [UIColor cyanColor];
    self.hours.font                 = [UIFont fontWithName:@"Avenir-Roman" size:14.5 ];

    self.rating.font                = [UIFont fontWithName:@"AvenirNext-Medium" size:20];
    self.rating.textColor           = UIColorFromRGB(0xFF5722);
    
    self.ratings_cupsOcoffee.backgroundColor= [UIColor purpleColor];
    
    self.ratings_numberOf.backgroundColor   = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3];
    self.ratings_numberOf.textColor         = UIColorFromRGB(0x7f8c8d);
    self.ratings_numberOf.font              = [UIFont fontWithName:@"AvenirNext-MediumItalic" size:10];
    
    self.About_label.font                = [UIFont fontWithName:@"AvenirNext-Medium" size:20];

    self.About.backgroundColor              = [UIColor brownColor];
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
