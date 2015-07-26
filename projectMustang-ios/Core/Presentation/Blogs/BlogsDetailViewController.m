//
//  BlogsDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogsDetailViewController.h"

@interface BlogsDetailViewController ()

@end

@implementation BlogsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
    [self setupHorizontalSpacing];
    [self setupSizeConstraints];
    [self setupPOSConstraints];
    
}

#pragma AutoLayout Positioning Methods
- (void)setupViews
{
    self.blogPostName    = [UILabel new];
    self.blogPostName.translatesAutoresizingMaskIntoConstraints  = NO;
    self.blogPostName.backgroundColor = [UIColor redColor];
    
    self.authorName     = [[UILabel alloc] init];
    self.authorName.translatesAutoresizingMaskIntoConstraints   = NO;
    self.authorName.backgroundColor = [UIColor blueColor];
    
    self.photoSource    = [[UILabel alloc] init];
    self.photoSource.translatesAutoresizingMaskIntoConstraints  = NO;
    self.photoSource.backgroundColor = [UIColor yellowColor];
    
    self.blogPost        = [[UITextView alloc] init];
    self.blogPost.translatesAutoresizingMaskIntoConstraints      = NO;
    self.blogPost.backgroundColor = [UIColor greenColor];
    
    self.blogPostImage       = [[UIImageView alloc] init];
    self.blogPostImage.translatesAutoresizingMaskIntoConstraints     = NO;
    self.blogPostImage.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.blogPostName];
    [self.view addSubview:self.authorName];
    [self.view addSubview:self.photoSource];
    [self.view addSubview:self.blogPost];
    [self.view addSubview:self.blogPostImage];
    
    self.viewsDictionary = @{@"postName": self.blogPostName,
                             @"authorName": self.authorName,
                             @"photoSource": self.photoSource,
                             @"blogPost": self.blogPost,
                             @"postImage": self.blogPostImage};
    self.metrics = @{@"vSpacing":@70,
                     @"hSpacing":@5,
                     @"postNameSize":@36};
    
}

-(void) setupHorizontalSpacing
{
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[postName(postNameSize)]-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[postName]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[authorName]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[photoSource]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[blogPost]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[postImage]-hSpacing-|"
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
                              toItem:self.blogPostName
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.6
                              constant:1.0]];
    //article Image
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.blogPostImage
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
                              toItem:self.blogPostName
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.5
                              constant:0.0]];
    
    //article ********** Definitely have to fix this since the view needs to be scrollable/adjustable to size of article content
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.blogPost
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
                              toItem:self.blogPostName
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //article Image
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.blogPostImage
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
                              toItem:self.blogPostImage
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    //article
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.blogPost
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoSource
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
}


#pragma methods that adjust appearance

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
