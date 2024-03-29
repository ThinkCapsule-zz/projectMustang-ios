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

@property (nonatomic, strong) UITextView    *articleName;
@property (nonatomic, strong) UILabel       *authorName;
@property (nonatomic, strong) UITextView    *article_description;
@property (nonatomic, strong) UITextView    *article;
@property (nonatomic, strong) UIImageView   *artImage;
@property (nonatomic, strong) NSDictionary  *viewsDictionary;
@property (nonatomic, strong) NSDictionary  *metrics;

@property (nonatomic, strong) NSString *photoStr;
@property (nonatomic, strong) NSMutableAttributedString *by;

-(void) setupTextViews;
-(void) setupImageViews;
-(void) adjustAttributes;
-(void) adjustContentSizes;

@property (nonatomic, strong)ArticleDataModel  *dataModel;
-(id)initWithData:(ArticleDataModel*)data;

@end
