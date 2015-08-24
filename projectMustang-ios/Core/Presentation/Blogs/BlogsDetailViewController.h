//
//  BlogsDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogsDetailViewController : UIViewController

@property (nonatomic,strong) UIScrollView  *scr_view;
@property (nonatomic) UILabel       *blogPostName;
@property (nonatomic) UILabel       *authorName;
@property (nonatomic) UILabel       *photoSource;
@property (nonatomic) UITextView    *blogPost;
@property (nonatomic) UIImageView   *blogPostImage;
@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;

@property (nonatomic, strong) NSString *blogPostNameStr;
@property (nonatomic, strong) NSString *authNameStr;
@property (nonatomic, strong) NSString *photoSourceStr;
@property (nonatomic, strong) NSString *blogPostStr;
@property (nonatomic, strong) NSString *photoStr;
@property (nonatomic, strong) NSMutableAttributedString *by;

-(void)setupViews;
-(void) setupHorizontalSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;
-(void) setupImage;
-(void) setupLabels;
-(void) loadData:(NSString*)txt :(NSString*)txt2 :(NSString*)txt3 :(NSString*)txt4 :(NSString*)img;

@end
