//
//  ArticleCell.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImageView *photoImageView;
-(void) loadImages:(NSString*)img;
-(void) loadLabel:(NSString*)txt;
//- (void)prepareForReuse;
-(void) setupImages;
-(void) setupLabels;

@end
