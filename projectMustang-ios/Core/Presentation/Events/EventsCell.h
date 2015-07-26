//
//  EventsCell.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImageView *photoImageView;
-(void) loadImages:(NSString*)img;
-(void) loadLabel:(NSString*)txt;
-(void) setupImages;
-(void) setupLabels;

@end
