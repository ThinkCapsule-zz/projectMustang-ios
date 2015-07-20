//
//  ArticlesDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticlesDetailViewController : UIViewController

@property (nonatomic) UILabel       *articleName;
@property (nonatomic) UILabel       *authorName;
@property (nonatomic) UILabel       *photoSource;
@property (nonatomic) UITextView    *article;
@property (nonatomic) UIImageView   *artImage;

@end
