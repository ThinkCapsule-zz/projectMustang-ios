//
//  ArticlesDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCArticleDataModel.h"
#import "TCArticleFactory.h"

@interface ArticlesDetailViewController : UIViewController

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

-(void) setupViews;
-(void) setupHorizontalSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;
-(void) setupLabels;
-(void) loadData:(NSString*)txt :(NSString*)txt2 :(NSString*)txt3 :(NSString*)txt4 :(NSString*)img;
-(void) setupImage;


@end
