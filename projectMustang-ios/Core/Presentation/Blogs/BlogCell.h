//
//  BlogCell.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogDataModel.h"
@interface BlogCell : UICollectionViewCell

@property (strong, nonatomic) UITextView       *titleLabel;
@property (strong, nonatomic) UILabel       *descLabel;
@property (strong, nonatomic) UILabel       *authLabel;
@property (strong, nonatomic) UIImageView   *photoImageView;
@property (strong, nonatomic) UIView        *overView;
@property (strong, nonatomic) UIView        *whiteView;
@property (strong, nonatomic) UILabel        *dateLabel;
@property (nonatomic, strong)BlogDataModel  *dataModel;
-(void)initWithData:(BlogDataModel*)data;
-(void) loadImages;
-(void) setupImages;
-(void) setupLabels;
-(void) setupPicOverlay;
-(void) setupBrLine;

@end
