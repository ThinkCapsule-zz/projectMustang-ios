//
//  BlogsDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogDataModel.h"

@interface BlogsDetailViewController : UIViewController

@property (nonatomic,strong) UIScrollView  *scr_view;
@property (nonatomic) UITextView       *blogPostName;
@property (nonatomic) UILabel       *authorName;
@property (nonatomic) UITextView       *blogDesc;
@property (nonatomic) UITextView    *blogPost;
@property (nonatomic) UIImageView   *blogPostImage;
@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;
@property (nonatomic, strong) NSMutableAttributedString *by;
@property (nonatomic, strong)BlogDataModel  *dataModel;
-(id)initWithData:(BlogDataModel*)data;
-(void)setupTextViews;
-(void) setupImageViews;
-(void) adjustAttributes;
-(void) adjustContentSizes;

@end
