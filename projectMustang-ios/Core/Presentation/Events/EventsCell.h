//
//  EventsCell.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDataModel.h"

@interface EventsCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImageView *photoImageView;
@property (nonatomic, strong)EventDataModel  *dataModel;
-(void)initWithData:(EventDataModel*)data;
-(void) loadImage;
-(void) loadLabel;
-(void) setupImageView;
-(void) setupLabels;

@end
