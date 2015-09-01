//
//  BlogCell.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogCell.h"
#import "BlogSectionViewController.h"
#import "CDAAsset.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation BlogCell

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
-(void)initWithData:(BlogDataModel *)data
{
    if(self)
    {
        self.dataModel = data;
        [self setupLabels];
        [self loadImages];
        [self fixFrameSizes];
        [self setupBrLine];
    }
}

-(void) setupImages
{
    self.photoImageView                 = [[UIImageView alloc] init];
    self.photoImageView.frame           = CGRectMake(self.photoImageView.frame.origin.x, self.photoImageView.frame.origin.y, self.frame.size.width, 180);
    self.photoImageView.contentMode     = UIViewContentModeScaleAspectFill;
    self.photoImageView.clipsToBounds   = YES;
    [self addSubview:self.photoImageView];
}

-(void) setupPicOverlay
{
    self.whiteView                  = [[UIView alloc] initWithFrame:CGRectMake(0.0,
                                                                               self.titleLabel.frame.origin.y+10,
                                                                               self.frame.size.width,
                                                                               self.titleLabel.frame.size.height+self.authLabel.frame.size.height+self.descLabel.frame.size.height-10)];
    self.whiteView.backgroundColor  = [UIColor whiteColor];
    [self addSubview:self.whiteView];
}

-(void) setupLabels
{
    self.descLabel                  = [[UILabel alloc] initWithFrame:CGRectMake(10.0, self.frame.size.height-24.0, self.frame.size.width-20.0, 24.0)];
    self.descLabel.textAlignment    = NSTextAlignmentLeft;
    self.descLabel.font             = [UIFont fontWithName:@"Avenir-Light" size:11];
    self.descLabel.textColor        = [UIColor blackColor];
    self.descLabel.text             = self.dataModel.blogDescription;
    
    
    NSString *auth;
    if (!self.dataModel.author) {
        auth = @"Anonymous";
    }
    else{
        auth = self.dataModel.author;
    }
    self.authLabel                  = [[UILabel alloc] initWithFrame:CGRectMake(10.0, self.descLabel.frame.origin.y-10.0, self.frame.size.width-20.0, 10.0)];
    self.authLabel.textAlignment    = NSTextAlignmentLeft;
    self.authLabel.font             = [UIFont fontWithName:@"Avenir-Roman" size:8];
    self.authLabel.textColor        = [UIColor grayColor];
    NSString *uppercasetxt          = [auth uppercaseString];
    self.authLabel.text             = uppercasetxt;
    
    [self.authLabel sizeToFit];
    
    self.dateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(self.authLabel.frame.size.width+self.authLabel.frame.origin.x+10.0, self.authLabel.frame.origin.y, 55.0, 10.0)];
    self.dateLabel.textAlignment    = NSTextAlignmentLeft;
    self.dateLabel.font             = [UIFont fontWithName:@"Avenir-Roman" size:8];
    self.dateLabel.textColor        = UIColorFromRGB(0xFF3E0C);
    NSDateFormatter *dateformatter1 = [[NSDateFormatter alloc] init];
    [dateformatter1 setDateStyle:NSDateFormatterLongStyle];
    self.dateLabel.text             = [[dateformatter1 stringFromDate:self.dataModel.publishDate] uppercaseString];
    
    self.titleLabel                     = [[UITextView alloc] initWithFrame:CGRectMake(8.0, self.authLabel.frame.origin.y-20.0, self.frame.size.width-16.0, 20.0)];
    self.titleLabel.textAlignment       = NSTextAlignmentLeft;
    NSMutableParagraphStyle *linestyle  = [[NSMutableParagraphStyle alloc] init];
    //linestyle.lineHeightMultiple        = 0.75f;
    linestyle.maximumLineHeight         = 17.0f;
    NSDictionary *attdic                = @{ NSParagraphStyleAttributeName: linestyle,};
    self.titleLabel.attributedText      = [[NSAttributedString alloc]initWithString:self.dataModel.series attributes:attdic];
    self.titleLabel.font                = [UIFont fontWithName:@"Avenir-Roman" size:15];
    self.titleLabel.textColor           = [UIColor blackColor];
    self.titleLabel.backgroundColor     = [UIColor clearColor];
    self.titleLabel.editable            = NO;
    self.titleLabel.scrollEnabled       = NO;
    
    
    [self addSubview:self.descLabel];
    [self addSubview:self.authLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.dateLabel];
    
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

-(void) fixFrameSizes
{
    CGFloat titleTopMargin = 8.0;
    CGFloat fixedWidth1 = self.titleLabel.frame.size.width;
    CGSize newSize1     = [self.titleLabel sizeThatFits:CGSizeMake(fixedWidth1, INFINITY)];
    CGRect newFrame1    = CGRectMake(self.titleLabel.frame.origin.x,
                                     self.authLabel.frame.origin.y-newSize1.height+titleTopMargin,
                                     self.titleLabel.frame.size.width,
                                     newSize1.height);
    newFrame1.size      = CGSizeMake(fmaxf(newSize1.width, fixedWidth1), newSize1.height);
    self.titleLabel.frame   = newFrame1;
    
    self.whiteView.frame    = CGRectMake(0.0,
                                         self.titleLabel.frame.origin.y,
                                         self.frame.size.width,
                                         self.titleLabel.frame.size.height+self.authLabel.frame.size.height+self.descLabel.frame.size.height-titleTopMargin);
}

-(void) setupBrLine
{
    CGRect rect                     = self.descLabel.frame;
    UIBezierPath *linePath          = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0.0, 2.0)];
    [linePath addLineToPoint:CGPointMake(rect.size.width, 2.0)];
    CAShapeLayer * lineLayer        = [CAShapeLayer layer];
    lineLayer.lineWidth             = 0.5;
    lineLayer.strokeColor           = [UIColor lightGrayColor].CGColor;
    lineLayer.fillColor             = nil;
    lineLayer.path                  = linePath.CGPath;
    
    [self.descLabel.layer addSublayer:lineLayer];
}


@end
