//
//  BlogsDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogsDetailViewController : UIViewController

@property (nonatomic) UILabel       *blogPostName;
@property (nonatomic) UILabel       *authorName;
@property (nonatomic) UILabel       *photoSource;
@property (nonatomic) UITextView    *blogPost;
@property (nonatomic) UIImageView   *blogPostImage;
@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;

-(void)setupViews;
-(void) setupHorizontalSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;

@end
