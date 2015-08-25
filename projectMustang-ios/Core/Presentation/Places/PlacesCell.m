//
//  PlacesCell.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesCell.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation PlacesCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor    = [UIColor colorWithWhite:1.0 alpha:0.8];
        [self setupImages];
        [self setupLabels];
    }
    return self;
}

-(void) setupImages
{
    self.photoImageView                 = [[UIImageView alloc] init];
    self.photoImageView.frame           = CGRectMake(self.photoImageView.frame.origin.x+7, self.photoImageView.frame.origin.y+7, self.frame.size.width*0.35, 99);
    self.photoImageView.contentMode     = UIViewContentModeScaleAspectFill; // This determines how the image fills the view
    self.photoImageView.clipsToBounds   = YES;
    [self addSubview:self.photoImageView];
}

-(void) setupLabels
{
    self.placeLabel                  = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*0.39, 7.0, self.frame.size.width, 27.0)];
    //self.placeLabel.backgroundColor  = [UIColor colorWithHue:0.2 saturation:0.4 brightness:0.2 alpha:0.1];
    self.placeLabel.textAlignment    = NSTextAlignmentLeft;
    self.placeLabel.font             = [UIFont fontWithName:@"AmericanTypewriter" size:21 ];
    self.placeLabel.textColor        = [UIColor blackColor];
    
    self.placeCategory                  = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*0.39, self.placeLabel.frame.size.height+7, self.frame.size.width, 19.0)];
    //self.placeCategory.backgroundColor  = [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:0.1];
    self.placeCategory.font             = [UIFont fontWithName:@"AvenirNext-MediumItalic" size:15];
    self.placeCategory.textColor        =[UIColor grayColor];
    
    self.distance                   = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*0.39, (self.placeLabel.frame.size.height*3)+7.0, self.frame.size.width, 23.0)];
    //self.distance.backgroundColor   = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.1];
    self.distance.font              = [UIFont fontWithName:@"AvenirNext-Medium" size:14 ];
    self.distance.textColor         = UIColorFromRGB(0xFF5722);
    
    self.ratings_coffeeCup1          = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.40, (self.distance.frame.origin.y)-19.0, self.frame.size.width/18, 19.0)];
    
    self.ratings_coffeeCup2          = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.40+(self.frame.size.width/17), (self.distance.frame.origin.y)-19.0, self.frame.size.width/18, 19.0)];
    
    self.ratings_coffeeCup3          = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.40+(self.frame.size.width/17*2), (self.distance.frame.origin.y)-19.0, self.frame.size.width/18, 19.0)];
    
    self.ratings_coffeeCup4          = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.40+(self.frame.size.width/17*3), (self.distance.frame.origin.y)-19.0, self.frame.size.width/18, 19.0)];
    
    self.ratings_coffeeCup5          = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.40+(self.frame.size.width/17*4), (self.distance.frame.origin.y)-19.0, self.frame.size.width/18, 19.0)];
    
    self.coffeeRates         = [[NSArray alloc] initWithObjects:self.ratings_coffeeCup1, self.ratings_coffeeCup2, self.ratings_coffeeCup3, self.ratings_coffeeCup4, self.ratings_coffeeCup5, nil];
    
    
    [self addSubview:self.placeLabel];
    [self addSubview:self.placeCategory];
    [self addSubview:self.ratings_coffeeCup1];
    [self addSubview:self.ratings_coffeeCup2];
    [self addSubview:self.ratings_coffeeCup3];
    [self addSubview:self.ratings_coffeeCup4];
    [self addSubview:self.ratings_coffeeCup5];
    [self addSubview:self.distance];
}

- (void) loadImages:(NSString*)img
{
    UIImage     *image          = [UIImage imageNamed:[NSString stringWithFormat:@"%@", img]];
    self.photoImageView.image   = image;
}

- (void) loadLabels:(NSString*)txt :(double)rate
{
    self.placeLabel.text    = txt;
    self.placeCategory.text = @"Restaurant";
    
//figure out how to access array elements and change their propertys (assign UI images to each image view depending on the rating
    /*NSInteger count = 0;

    for (count; count<3; count++)
    {
    }
    */
    self.ratings_coffeeCup1.image           = [UIImage imageNamed:@"1.00"];
    self.ratings_coffeeCup2.image           = [UIImage imageNamed:@"1.00"];
    self.ratings_coffeeCup3.image           = [UIImage imageNamed:@"0.00"];
    self.ratings_coffeeCup4.image           = [UIImage imageNamed:@"0.00"];
    self.ratings_coffeeCup5.image           = [UIImage imageNamed:@"0.00"];
    
    // find rating of place, add coloured coffee cups to photo image view
    // double rateRemainder = rate%1;
    // fill in 5-(# of coffee cups) grey coffee cups
    
    // if distance is less than 100 meters, append '<' sign to beginning of string (check contentful for format)
    // format according to whatever the input for distance is
    self.distance.text      = @"100m";
    
    
    //fix when we figure out what kind of data we're gettinggg!!!! (obvs for everythign else too)

}


@end
