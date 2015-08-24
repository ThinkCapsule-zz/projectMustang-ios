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
        self.backgroundColor    = [UIColor clearColor];
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
    self.photoImageView.frame           = CGRectMake(self.photoImageView.frame.origin.x, self.photoImageView.frame.origin.y, self.frame.size.width, 210);
    self.photoImageView.contentMode     = UIViewContentModeScaleAspectFill;
    self.photoImageView.clipsToBounds   = YES;
    [self.photoImageView setAlpha:0.7];
    [self addSubview:self.photoImageView];
}

-(void) setupPicOverlay //a gradient overlay :)
{
    self.overView               = [[UIView alloc] initWithFrame:CGRectMake(self.photoImageView.frame.origin.x, self.photoImageView.frame.origin.y, self.frame.size.width, 210)];
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
    self.descLabel                  = [[UILabel alloc] initWithFrame:CGRectMake(10.0, self.frame.size.height-26.0, self.frame.size.width-20.0, 26.0)];
    self.descLabel.textAlignment    = NSTextAlignmentLeft;
    self.descLabel.font             = [UIFont fontWithName:@"AvenirNext-Medium" size:13];
    self.descLabel.textColor        = [UIColor whiteColor];
    self.descLabel.text             = self.dataModel.subtitle;
    
    self.authLabel                  = [[UILabel alloc] initWithFrame:CGRectMake(10.0, self.descLabel.frame.origin.y-20.0, self.frame.size.width-10.0, 15.0)];
    self.authLabel.textAlignment    = NSTextAlignmentLeft;
    self.authLabel.font             = [UIFont fontWithName:@"AvenirNext-Medium" size:10 ];
    self.authLabel.textColor        = [UIColor whiteColor];
    NSString *uppercasetxt          = [self.dataModel.author uppercaseString];
    self.authLabel.text             = uppercasetxt;
    
    self.titleLabel                 = [[UITextView alloc] initWithFrame:CGRectMake(10.0, self.authLabel.frame.origin.y-20.0, self.frame.size.width-10.0, 20.0)];
    self.titleLabel.textAlignment   = NSTextAlignmentLeft;
    self.titleLabel.font            = [UIFont fontWithName:@"AvenirNext-Medium" size:18];
    self.titleLabel.textColor       = [UIColor redColor];
    self.backgroundColor            = [UIColor clearColor];
    self.titleLabel.editable        = NO;
    self.titleLabel.scrollEnabled   = NO;
    self.titleLabel.text            = self.dataModel.headline;
    
    [self addSubview:self.descLabel];
    [self addSubview:self.authLabel];
    [self addSubview:self.titleLabel];
    
    
// is there a way to change the padding around the text so that minimal space is taken between text and other labels?
    CGFloat fixedWidth1 = self.titleLabel.frame.size.width;
    CGSize newSize1     = [self.titleLabel sizeThatFits:CGSizeMake(fixedWidth1, INFINITY)];
    CGRect newFrame1    = CGRectMake(self.titleLabel.frame.origin.x, self.authLabel.frame.origin.y-newSize1.height, self.titleLabel.frame.size.width, newSize1.height-25.0);
    newFrame1.size      = CGSizeMake(fmaxf(newSize1.width, fixedWidth1), newSize1.height);
    self.titleLabel.frame = newFrame1;
}

- (void) loadImages
{
    CDAAsset *asset = self.dataModel.thumbnails[0];
    UIImage *pic    = [UIImage imageWithData:[NSData dataWithContentsOfURL:asset.URL]];
    
    if (!pic)
    {
        pic = [UIImage imageNamed:[NSString stringWithFormat:@"alchii"]];
    }
     self.photoImageView.image   = pic;
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
