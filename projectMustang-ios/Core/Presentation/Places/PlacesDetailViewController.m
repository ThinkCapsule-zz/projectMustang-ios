//
//  PlacesDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesDetailViewController.h"

@interface PlacesDetailViewController ()
@end

@implementation PlacesDetailViewController



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


- (void)setupViews
{
    self.eventName    = [UILabel new];
    self.eventName.translatesAutoresizingMaskIntoConstraints  = NO;
    self.eventName.backgroundColor = [UIColor redColor];
    
    self.hostName     = [[UILabel alloc] init];
    self.hostName.translatesAutoresizingMaskIntoConstraints   = NO;
    self.hostName.backgroundColor = [UIColor blueColor];
    
    self.photoSource    = [[UILabel alloc] init];
    self.photoSource.translatesAutoresizingMaskIntoConstraints  = NO;
    self.photoSource.backgroundColor = [UIColor yellowColor];
    
    self.eventDeets        = [[UITextView alloc] init];
    self.eventDeets.translatesAutoresizingMaskIntoConstraints      = NO;
    self.eventDeets.backgroundColor = [UIColor greenColor];
    
    self.photoImage       = [[UIImageView alloc] init];
    self.photoImage.translatesAutoresizingMaskIntoConstraints     = NO;
    self.photoImage.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.eventName];
    [self.view addSubview:self.hostName];
    [self.view addSubview:self.photoSource];
    [self.view addSubview:self.eventDeets];
    [self.view addSubview:self.photoImage];
    
    self.viewsDictionary = @{@"eventName": self.eventName,
                             @"hostName": self.hostName,
                             @"photoSource": self.photoSource,
                             @"eventDeets": self.eventDeets,
                             @"photoImage": self.photoImage};
    self.metrics = @{@"vSpacing":@70,
                     @"hSpacing":@15,
                     @"hSpacing1":@1,
                     @"eventNameSize":@36};
    
}

-(void) setupHorizontalSpacing
{
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[eventName(eventNameSize)]-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[eventName]-hSpacing-|"
                                                                        options:0
                                                                        metrics:self.metrics
                                                                          views:self.viewsDictionary];
    NSArray *constraint_POS_H1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[hostName]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[photoSource]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[eventDeets]-hSpacing-|"
                                                                         options:0
                                                                         metrics:self.metrics
                                                                           views:self.viewsDictionary];
    NSArray *constraint_POS_H4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing1-[photoImage]-hSpacing1-|"
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
                              constraintWithItem:self.hostName
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.eventName
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.6
                              constant:1.0]];
    //article Image
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.photoImage
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
                              toItem:self.eventName
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.5
                              constant:0.0]];
    
    //article ********** Definitely have to fix this since the view needs to be scrollable/adjustable to size of article content
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.eventDeets
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
                              constraintWithItem:self.hostName
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.eventName
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //article Image
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.photoImage
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.hostName
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    
    //PhotoSource
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.photoSource
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoImage
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:0.0]];
    //article
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.eventDeets
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.photoSource
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:13.0]];
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
