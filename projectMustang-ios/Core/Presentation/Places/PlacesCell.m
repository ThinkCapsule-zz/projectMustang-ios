//
//  PlacesCell.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesCell.h"

@implementation PlacesCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentJustified;
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont fontWithName:@"verdana-bold" size:19];
        self.label.backgroundColor = [UIColor colorWithHue:0.2 saturation:0.4 brightness:0.2 alpha:0.1];
        
        [self.contentView addSubview:self.label];;
    }
    return self;
}

@end
