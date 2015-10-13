//
//  EventsCell.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "EventsCell.h"
#import "EventsSectionViewController.h"

@implementation EventsCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor    = [UIColor colorWithWhite:1.0 alpha:0.6];
        [self setupImageView];
        [self setupLabels];
    }
    return self;
}

-(void)initWithData:(EventDataModel *)data
{
    if(self)
    {
        self.dataModel = data;
        [self loadLabel];
        [self loadImage];
    }
}

-(void) setupImageView
{
    self.photoImageView                 = [[UIImageView alloc] init];
    self.photoImageView.frame           = CGRectMake(self.photoImageView.frame.origin.x, self.photoImageView.frame.origin.y, self.frame.size.width, 100);
    self.photoImageView.contentMode     = UIViewContentModeScaleAspectFill; // This determines how the image fills the view
    self.photoImageView.clipsToBounds   = YES;
    [self.photoImageView setAlpha:0.7];
    [self addSubview:self.photoImageView];
}

-(void) setupLabels
{
    self.label                  = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
    self.label.backgroundColor  = [UIColor colorWithHue:0.2 saturation:0.4 brightness:0.2 alpha:0.1];
    self.label.textAlignment    = NSTextAlignmentLeft;
    self.label.font             = [UIFont fontWithName:@"verdana-bold" size:19 ];
    self.label.textColor        = [UIColor whiteColor];
    [self addSubview:self.label];
}

- (void) loadImage{
    CDAAsset *asset = self.dataModel.thumbnails[0];
    UIImage *pic    = [UIImage imageWithData:[NSData dataWithContentsOfURL:asset.URL]];
    
    if (!pic)
    {
        pic = [UIImage imageNamed:[NSString stringWithFormat:@"Eve"]];
    }
    self.photoImageView.image   = pic;
}

- (void) loadLabel{
    self.label.text             = self.dataModel.eventName;
}


@end
