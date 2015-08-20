//
//  ArticlesDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticlesDetailViewController.h"
#import "ArticleSectionViewController.h"


@interface ArticlesDetailViewController ()
@end

@implementation ArticlesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}

#pragma AutoLayout Positioning Methods

- (void)setupViews
{
    self.articleName    = [UILabel new];
    self.articleName.translatesAutoresizingMaskIntoConstraints  = NO;
    self.articleName.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
    self.articleName.text = self.articleNameStr;
    
    self.authorName     = [[UILabel alloc] init];
    self.authorName.translatesAutoresizingMaskIntoConstraints   = NO;
    self.authorName.backgroundColor = [UIColor blueColor];
    self.authorName.text = @"auth name";
    
    
    self.photoSource    = [[UILabel alloc] init];
    self.photoSource.translatesAutoresizingMaskIntoConstraints  = NO;
    self.photoSource.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.6];
    self.photoSource.text = @"photosource";
    
    self.article        = [[UITextView alloc] init];
    self.article.translatesAutoresizingMaskIntoConstraints      = NO;
    self.article.backgroundColor = [UIColor greenColor];
    self.article.editable = NO;
    self.article.text = @"hahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhaahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhaahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhaahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahahhahahahahhahahahahah";
    
    self.artImage       = [[UIImageView alloc] init];
    self.artImage.translatesAutoresizingMaskIntoConstraints     = NO;
    self.artImage.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.articleName];
    [self.view addSubview:self.authorName];
    [self.view addSubview:self.photoSource];
    [self.view addSubview:self.article];
    [self.view addSubview:self.artImage];
    
    self.viewsDictionary = @{@"articleName": self.articleName,
                             @"authorName": self.authorName,
                             @"photoSource": self.photoSource,
                             @"article": self.article,
                             @"artImage": self.artImage};
    self.metrics = @{@"vSpacing":@70,
                     @"hSpacing1":@1,
                     @"hSpacing2":@13,
                     @"artNameSize":@36};
    
}

-(void) setupHorizontalSpacing
{
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
    
    //article ********** Definitely have to fix this since the view needs to be scrollable/adjustable to size of article content
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.article
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
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
                              constant:0.0]];
    
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
}


#pragma populating and appearance methods

-(void) setupLabels
{
    self.articleName.textAlignment    = NSTextAlignmentLeft;
    self.articleName.font             = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:23 ];
    self.articleName.textColor        = [UIColor blackColor];
    
    self.authorName.textAlignment    = NSTextAlignmentLeft;
    self.authorName.font             = [UIFont fontWithName:@"AvenirNext-Regular" size:14];
    self.authorName.textColor        = [UIColor blackColor];
    
    self.photoSource.textAlignment    = NSTextAlignmentLeft;
    self.photoSource.font             = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:11.5 ];
    self.photoSource.textColor        = [UIColor blackColor];
    
    self.article.textAlignment    = NSTextAlignmentLeft;
    self.article.font             = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:13 ];
    self.article.textColor        = [UIColor blackColor];
    

}

-(void) setupImage
{
    self.artImage.contentMode     = UIViewContentModeScaleAspectFill;
    self.artImage.clipsToBounds   = YES;
    [self.artImage setAlpha:0.7];
    //    [self addSubview:self.photoImageView];
}

- (void) loadData:(NSString*)txt :(NSString*)txt2 :(NSString*)txt3 :(NSString*)txt4 :(NSString*)img
{
    
    self.articleNameStr = txt;
    [self.articleName setText:txt];
    self.authorName.text    = txt2;
    self.photoSource.text   = txt3;
    self.article.text       = txt4;
    UIImage     *image      = [UIImage imageNamed:[NSString stringWithFormat:@"%@", img]];
    self.artImage.image     = image;
    
    [self setupViews];
    [self setupHorizontalSpacing];
    [self setupSizeConstraints];
    [self setupPOSConstraints];
    [self setupLabels];
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
