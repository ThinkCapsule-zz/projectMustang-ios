//
//  ArticlesDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleDataModel.h"
#import "TCArticleFactory.h"

@interface ArticlesDetailViewController : UIViewController

@property (strong, nonatomic) UIScrollView *scr_view;
@property (strong, nonatomic) UIView *upview;

@property (nonatomic, strong) UILabel       *articleName;
@property (nonatomic, strong) UILabel       *authorName;
@property (nonatomic, strong) UILabel       *photoSource;
@property (nonatomic, strong) UITextView    *article;
@property (nonatomic, strong) UIImageView   *artImage;
@property (nonatomic, strong) NSDictionary  *viewsDictionary;
@property (nonatomic, strong) NSDictionary  *metrics;

@property (nonatomic, strong) NSString *articleNameStr;
@property (nonatomic, strong) NSString *authNameStr;
@property (nonatomic, strong) NSString *photoSourceStr;
@property (nonatomic, strong) NSString *articleStr;
@property (nonatomic, strong) NSString *photoStr;
@property (nonatomic, strong) NSMutableAttributedString *by;

-(void) setupViews;
-(void) setupSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;
-(void) setupLabels;

-(void) setupImage;

@property (nonatomic, strong)ArticleDataModel  *dataModel;
-(id)initWithData:(ArticleDataModel*)data;

@end
