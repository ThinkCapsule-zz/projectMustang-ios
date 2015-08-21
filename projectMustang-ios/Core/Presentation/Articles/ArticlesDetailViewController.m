//
//  ArticlesDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticlesDetailViewController.h"
#import "ArticleSectionViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ArticlesDetailViewController ()
@end

@implementation ArticlesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    //self.scr_view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //[self.scr_view addSubview: self.upview];
    
    //TCArticleDataModel *article = [[TCArticleDataModel alloc]init];
}


#pragma AutoLayout Positioning Methods

- (void)setupViews
{
    self.articleName                = [UILabel new];
    self.articleName.text           = self.articleNameStr;
    
    NSString *hihi  = [NSString stringWithFormat:@"By %@", self.authNameStr];
    self.by         = [[NSMutableAttributedString alloc] initWithString:hihi];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:UIColorFromRGB(0xFF5722)
                    range:[hihi rangeOfString:self.authNameStr]];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:UIColorFromRGB(0x7f8c8d)
                    range:NSMakeRange(0,2)];
    
    self.authorName                 = [[UILabel alloc] init];
    self.authorName.attributedText  = self.by;
    
    self.photoSource                = [[UILabel alloc] init];
    self.photoSource.text           = self.photoSourceStr;
    
    self.article                    = [[UITextView alloc] init];
    self.article.text               = self.articleStr;
    
    self.artImage                   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoStr]];
    
    [self.articleName   setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.authorName    setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.photoSource   setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.article       setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.artImage      setTranslatesAutoresizingMaskIntoConstraints: NO];
    /*
    [self.upview addSubview:self.articleName];
    [self.upview addSubview:self.authorName];
    [self.upview addSubview:self.photoSource];
    [self.upview addSubview:self.article];
    [self.upview addSubview:self.artImage];
    */
    [self.view addSubview:self.articleName];
    [self.view addSubview:self.authorName];
    [self.view addSubview:self.photoSource];
    [self.view addSubview:self.article];
    [self.view addSubview:self.artImage];
    
}

-(void) setupSpacing
{
    self.viewsDictionary = @{@"articleName": self.articleName,
                             @"authorName": self.authorName,
                             @"photoSource": self.photoSource,
                             @"article": self.article,
                             @"artImage": self.artImage};
    
    self.metrics = @{@"vSpacing":@70,
                     @"hSpacing1":@1,
                     @"hSpacing2":@13,
                     @"artNameSize":@36};
    
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[articleName(artNameSize)]-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing2-[articleName]-hSpacing2-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing2-[authorName]-hSpacing2-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing2-[photoSource]-hSpacing2-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing2-[article]-hSpacing2-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing1-[artImage]-hSpacing1-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    /*[self.upview addConstraints:constraint_POS_V];
    [self.upview addConstraints:constraint_POS_H];
    [self.upview addConstraints:constraint_POS_H1];
    [self.upview addConstraints:constraint_POS_H2];
    [self.upview addConstraints:constraint_POS_H3];
    [self.upview addConstraints:constraint_POS_H4];
    */
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
    [self.view addConstraints:constraint_POS_H1];
    [self.view addConstraints:constraint_POS_H2];
    [self.view addConstraints:constraint_POS_H3];
    [self.view addConstraints:constraint_POS_H4];
    
}

-(void) setupSizeConstraints
{
    //author name
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.authorName
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.articleName
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.6
                              constant:1.0]];
    //article Image
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.artImage
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.33
                              constant:0.0]];
    //PhotoSource
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.photoSource
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.articleName
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.5
                              constant:0.0]];
}

-(void) setupPOSConstraints
{
    //author name
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.authorName
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.articleName
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //article Image
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.artImage
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.authorName
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:5.0]];
    
    //PhotoSource
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.photoSource
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.artImage
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    //article
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.article
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoSource
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
    
    //self.scr_view.contentSize    =  CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}


#pragma populating and appearance methods

-(void) setupLabels
{
    self.articleName.textAlignment      = NSTextAlignmentLeft;
    self.articleName.font               = [UIFont fontWithName:@"AvenirNext-Medium" size:24 ];
    self.articleName.textColor          = UIColorFromRGB(0x3f3f3f);
    self.articleName.backgroundColor    = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.1];

    self.authorName.textAlignment       = NSTextAlignmentLeft;
    self.authorName.font                = [UIFont fontWithName:@"Avenir-Roman" size:13];
    self.authorName.backgroundColor     = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.1];

    self.photoSource.textAlignment      = NSTextAlignmentLeft;
    self.photoSource.font               = [UIFont fontWithName:@"Avenir-Roman" size:11.5 ];
    self.photoSource.textColor          = UIColorFromRGB(0x7f8c8d);
    self.photoSource.backgroundColor    = [UIColor colorWithRed:0.0 green:0.0 blue:0.5 alpha:0.1];

    self.article.textAlignment      = NSTextAlignmentLeft;
    self.article.font               = [UIFont fontWithName:@"Avenir-Roman" size:13 ];
    self.article.textColor          = [UIColor blackColor];
    self.article.backgroundColor    = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1];
    self.article.editable           = NO;
    self.article.scrollEnabled      = NO;
}

-(void) setupImage
{
    self.artImage.contentMode     = UIViewContentModeScaleAspectFill;
    self.artImage.clipsToBounds   = YES;
}

- (void) loadData:(NSString*)txt :(NSString*)txt2 :(NSString*)txt3 :(NSString*)txt4 :(NSString*)img
{
    self.articleNameStr = txt;
    self.authNameStr    = txt2;
    self.photoSourceStr = txt3;
    self.articleStr     = txt4;
    self.photoStr       = img;
    
    [self setupViews];
    [self setupSpacing];
    [self setupLabels];

    [self setupSizeConstraints];
    [self setupPOSConstraints];
    [self setupImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
