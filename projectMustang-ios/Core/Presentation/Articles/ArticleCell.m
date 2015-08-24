//
//  ArticleCell.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticleCell.h"
#import "ArticleSectionViewController.h"


@implementation ArticleCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor    = [UIColor colorWithWhite:1.0 alpha:0.6];
        [self setupImages];
        [self setupPicOverlay];
    }
    return self;
}

-(void)initWithData:(ArticleDataModel *)data
{
    if(self)
    {
        self.dataModel = data;
        [self setupLabels];
        [self loadImages];
        [self addBrLine];
    }
}

-(void) setupImages
{
    self.photoImageView                 = [[UIImageView alloc] init];
    self.photoImageView.frame           = CGRectMake(self.photoImageView.frame.origin.x, self.photoImageView.frame.origin.y, self.frame.size.width, 190);
    self.photoImageView.contentMode     = UIViewContentModeScaleAspectFill;
    self.photoImageView.clipsToBounds   = YES;
    [self.photoImageView setAlpha:0.7];
    [self addSubview:self.photoImageView];
}

-(void) setupPicOverlay //a gradient overlay :)
{
    self.overView               = [[UIView alloc] initWithFrame:CGRectMake(self.photoImageView.frame.origin.x, self.photoImageView.frame.origin.y, self.frame.size.width, 190)];
    CAGradientLayer *gradient   = [CAGradientLayer layer];
    gradient.frame              = self.bounds;
    gradient.colors             = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:127.0f/255.0f
                                                                                 green:140.0f/255.0f
                                                                                  blue:141.0f/255.0f
                                                                                 alpha:1.0] CGColor],
                                                            (id)[[UIColor blackColor] CGColor], nil];
    [self.layer insertSublayer:gradient atIndex:0];
}

-(void) setupLabels
{
    self.titleLabel                 = [[UILabel alloc] initWithFrame:CGRectMake(19.0, 7.0, self.frame.size.width-15, 29.9)];
    self.titleLabel.textAlignment   = NSTextAlignmentLeft;
    self.titleLabel.font            = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:25 ];
    self.titleLabel.textColor       = [UIColor whiteColor];
    //    self.titleLabel.editable        = NO;
    //    self.titleLabel.scrollEnabled   = NO;
    self.titleLabel.text            = self.dataModel.headline;
    
    self.descLabel                  = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 135, self.frame.size.width-15, 30)];
    self.descLabel.textAlignment    = NSTextAlignmentLeft;
    self.descLabel.font             = [UIFont fontWithName:@"AvenirNext-Regular" size:14];
    self.descLabel.textColor        = [UIColor whiteColor];
    self.descLabel.text             = self.dataModel.subtitle;
    
    self.authLabel                  = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 160, self.frame.size.width-15, 20.0)];
    self.authLabel.textAlignment    = NSTextAlignmentLeft;
    self.authLabel.font             = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:11.5 ];
    self.authLabel.textColor        = [UIColor whiteColor];
    NSString *uppercasetxt      = [self.dataModel.author uppercaseString];
    self.authLabel.text         = uppercasetxt;
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.descLabel];
    [self addSubview:self.authLabel];
}

- (void) loadImages
{
    UIImage     *image          = [UIImage imageNamed:[NSString stringWithFormat:@"alchii"]];
    self.photoImageView.image   = image;
}

-(void) addBrLine
{
    CGRect rect                     = self.descLabel.frame;
    UIBezierPath *linePath          = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, 0)];
    [linePath addLineToPoint:CGPointMake(rect.size.width-15, 0)];
    CAShapeLayer * lineLayer        = [CAShapeLayer layer];
    lineLayer.lineWidth             = 1.0;
    lineLayer.strokeColor           = [UIColor whiteColor].CGColor;
    lineLayer.fillColor             = nil;
    lineLayer.path                  = linePath.CGPath;
    
    [self.descLabel.layer addSublayer:lineLayer];
}

@end
