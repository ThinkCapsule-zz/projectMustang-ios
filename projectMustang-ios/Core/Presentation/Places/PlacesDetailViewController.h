//
//  PlacesDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesDetailViewController : UIViewController

@property (nonatomic) UIImageView   *photoImage;

@property (nonatomic,strong) UILabel       *placeName;
@property (nonatomic,strong) UILabel       *placeType;
@property (nonatomic,strong) UIImageView   *address_img;
@property (nonatomic,strong) UILabel       *address;
@property (nonatomic,strong) UIImageView   *phone_img;
@property (nonatomic,strong) UILabel       *phone;
@property (nonatomic,strong) UIImageView   *hours_img;
@property (nonatomic,strong) UILabel       *hours;
@property (nonatomic,strong) UILabel       *rating;
@property (nonatomic,strong) UILabel       *ratings_numberOf;
@property (nonatomic,strong) UIImageView   *ratings_cupsOcoffee;
@property (nonatomic,strong) UITextView    *About;
@property (nonatomic,strong) UILabel       *About_label;


@property (nonatomic,strong) NSString       *placeName_str;
@property (nonatomic,strong) NSString       *placeType_str;
@property (nonatomic,strong) NSString       *address_str;
@property (nonatomic,strong) NSString       *phone_str;
@property (nonatomic,strong) NSString       *hours_str;
@property (nonatomic,strong) NSString       *rating_str;
@property (nonatomic,strong) NSString       *ratings_numberOf_str;
@property (nonatomic,strong) NSString       *About_str;


@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;

-(void) setupViews;
-(void) setupHorizontalSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;
-(void) loadData:(NSString*)placeName :(NSString*)placeType :(NSString*)address :(NSString*)phone :(NSString*)hours :(NSString*)rating :(NSString*)numofratings :(NSString*)about;
-(void) loadAppearances;


@end
