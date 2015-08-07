//
//  PlacesCell.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView   *photoImageView;
@property (strong, nonatomic) UILabel       *placeLabel;
@property (strong, nonatomic) UILabel       *placeCategory;
//@property (strong, nonatomic) UIImageView   *ratings_coffeeCup1;
@property (strong, nonatomic) UILabel       *distance;
@property (nonatomic, strong) NSArray       *coffeeRates;
@property (nonatomic, strong) UIImageView   *ratings_coffeeCup1;
@property (nonatomic, strong) UIImageView   *ratings_coffeeCup2;
@property (nonatomic, strong) UIImageView   *ratings_coffeeCup3;
@property (nonatomic, strong) UIImageView   *ratings_coffeeCup4;
@property (nonatomic, strong) UIImageView   *ratings_coffeeCup5;
-(void) loadImages:(NSString*)img;
-(void) loadLabels:(NSString*)txt :(double)rate;
-(void) setupImages;
-(void) setupLabels;

@end
