//
//  ArticlesDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleDataModel.h"
#import "ArticleFactory.h"

@interface ArticlesDetailViewController : UIViewController

@property (strong, nonatomic) UIScrollView *scr_view;
@property (nonatomic, strong) UITextView    *articleName;
@property (nonatomic, strong) UILabel       *authorName;
@property (nonatomic, strong) UITextView    *article_description;
@property (nonatomic, strong) UITextView    *article;
@property (nonatomic, strong) UIImageView   *artImage;
@property (nonatomic, strong) NSDictionary  *viewsDictionary;
@property (nonatomic, strong) NSDictionary  *metrics;
@property (nonatomic, strong) NSMutableAttributedString *by;
@property (nonatomic, strong)ArticleDataModel  *dataModel;
-(id)initWithData:(ArticleDataModel*)data;
-(void) setupTextViews;
-(void) setupImageViews;
-(void) adjustAttributes;
-(void) adjustContentSizes;

@end
