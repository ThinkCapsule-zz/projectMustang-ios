//
//  BlogsDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogsDetailViewController.h"
#import "BlogSectionViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BlogsDetailViewController ()
@end

@implementation BlogsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view                   = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor   = [UIColor whiteColor];
}

#pragma AutoLayout Positioning Methods
- (void)setupViews
{
    self.blogPostName                   = [UILabel new];
    self.blogPostName.text              = self.blogPostNameStr;

    
    //Author Name
    
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

    
    self.photoSource        = [[UILabel alloc] init];
    self.photoSource.text   = self.photoSourceStr;

    self.blogPost           = [[UITextView alloc] init];
    self.blogPost.text      = self.blogPostStr;

    self.blogPostImage      = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photoStr]];

    
    self.blogPostName.translatesAutoresizingMaskIntoConstraints = NO;
    self.authorName.translatesAutoresizingMaskIntoConstraints   = NO;
    self.photoSource.translatesAutoresizingMaskIntoConstraints  = NO;
    self.blogPost.translatesAutoresizingMaskIntoConstraints     = NO;
    self.blogPostImage.translatesAutoresizingMaskIntoConstraints= NO;
    
    [self.view addSubview:self.blogPostName];
    [self.view addSubview:self.authorName];
    [self.view addSubview:self.photoSource];
    [self.view addSubview:self.blogPost];
    [self.view addSubview:self.blogPostImage];
}

-(void) setupHorizontalSpacing
{
    self.viewsDictionary = @{@"postName": self.blogPostName,
                             @"authorName": self.authorName,
                             @"photoSource": self.photoSource,
                             @"blogPost": self.blogPost,
                             @"postImage": self.blogPostImage};
    self.metrics = @{@"vSpacing":@70,
                     @"hSpacing1":@1,
                     @"hSpacing2":@13,
                     @"postNameSize":@36};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[postName(postNameSize)]-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing2-[postName]-hSpacing2-|"
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
    NSArray *constraint_POS_H3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing2-[blogPost]-hSpacing2-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing1-[postImage]-hSpacing1-|"
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
    
    //article
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

#pragma populating and appearance methods

-(void) setupLabels
{
    self.blogPostName.textAlignment     = NSTextAlignmentLeft;
    self.blogPostName.font              = [UIFont fontWithName:@"AvenirNext-Medium"
                                                      size:24 ];
    self.blogPostName.textColor         = UIColorFromRGB(0x3f3f3f);
    self.blogPostName.backgroundColor   = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.2];

    
    self.authorName.textAlignment   = NSTextAlignmentLeft;
    self.authorName.font            = [UIFont fontWithName:@"Avenir-Roman"
                                                      size:13];
    self.authorName.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.2];

    
    self.photoSource.textAlignment  = NSTextAlignmentLeft;
    self.photoSource.font           = [UIFont fontWithName:@"Avenir-Roman"
                                                      size:11.5 ];
    self.photoSource.textColor      = UIColorFromRGB(0x7f8c8d);
    self.photoSource.backgroundColor= [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.2];

    
    self.blogPost.textAlignment     = NSTextAlignmentLeft;
    self.blogPost.font              = [UIFont fontWithName:@"Avenir-Roman"
                                                      size:13 ];
    self.blogPost.textColor         = [UIColor blackColor];
    self.blogPost.backgroundColor   = [UIColor colorWithRed:0.0 green:0.5 blue:0.5 alpha:0.2];
}

-(void) setupImage
{
    self.blogPostImage.contentMode     = UIViewContentModeScaleAspectFill;
    self.blogPostImage.clipsToBounds   = YES;
}

- (void) loadData:(NSString*)txt :(NSString*)txt2 :(NSString*)txt3 :(NSString*)txt4 :(NSString*)img
{
    self.blogPostNameStr    = txt;
    self.authNameStr        = txt2;
    self.photoSourceStr     = txt3;
    self.blogPostStr        = txt4;
    self.photoStr           = img;

    [self setupViews];
    [self setupHorizontalSpacing];
    [self setupSizeConstraints];
    [self setupPOSConstraints];
    [self setupLabels];
    [self setupImage];
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
