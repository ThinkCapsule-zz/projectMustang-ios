//
//  ArticleCell.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleDataModel.h"
@interface ArticleCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descLabel;
@property (strong, nonatomic) UILabel *authLabel;
@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UIView *overView;
-(void) loadImages;
-(void) setupImages;
-(void) setupLabels;
-(void) setupPicOverlay;
-(void) addBrLine;

@property (nonatomic, strong)ArticleDataModel  *dataModel;
-(void)initWithData:(ArticleDataModel*)data;

@end
