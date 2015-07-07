//
//  ArticleCell.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticleCell.h"

@implementation ArticleCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentLeft;
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont fontWithName:@"verdana-bold" size:19 ];
        self.label.backgroundColor = [UIColor colorWithHue:0.2 saturation:0.4 brightness:0.2 alpha:0.1];
        [self.contentView addSubview:self.label];
        
        //I'm not sure how to align the text to the top left. I've tried sizetofit but failed
    }
    return self;
}

@end
