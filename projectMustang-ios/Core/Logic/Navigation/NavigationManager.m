//
//  NavigationManager.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "NavigationManager.h"
#import "MainViewController.h"
#import "MainMenuViewController.h"
#import <RESideMenu/RESideMenu.h>

/* sections */
#import "ArticleSectionViewController.h"
#import "BlogSectionViewController.h"
#import "VideoSectionViewController.h"
#import "EventsSectionViewController.h"
#import "PlacesSectionViewController.h"
#import "SignOnViewController.h"

/* Onboarding flow */
#import "TCWalkthroughViewController.h"

@interface NavigationManager ()

@end

@implementation NavigationManager

+ (NavigationManager* )singletonInstance {
    
    /* Create singleton instance of NavigationManager to be used everywhere */
    static dispatch_once_t once_token;
    static NavigationManager *_singletonInstance = nil;
    
    dispatch_once(&once_token, ^{
        _singletonInstance = [[NavigationManager alloc] init];
    });
    
    return _singletonInstance;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) showLogin {
    
    [self setNavigationBarHidden:YES];
    SignOnViewController* signonVC = [[SignOnViewController alloc] init];
    [self setViewControllers:@[signonVC] animated:NO];
}

- (void) showWalkthrough {
    
    [self setNavigationBarHidden:YES];
    TCWalkthroughViewController* wtViewController = [[TCWalkthroughViewController alloc] init];
    [self setViewControllers:@[wtViewController] animated:NO];
}
- (void) goToMainSectionWithAnimation:(BOOL)animated {
    
    [self setNavigationBarHidden:NO];
    MainViewController* mainSectionVC = [[MainViewController alloc] init];
    [self setViewControllers:@[mainSectionVC] animated:animated];
}
- (void) goToMainSection {
    
    [self goToMainSectionWithAnimation:NO];
    
}
- (void) goToArticleSection {
    
    ArticleSectionViewController* articleSectionVC = [[ArticleSectionViewController alloc] init];
    [self setViewControllers:@[articleSectionVC] animated:NO];
}

- (void) goToBlogSection {
    
    BlogSectionViewController* blogSectionVC = [[BlogSectionViewController alloc] init];
    [self setViewControllers:@[blogSectionVC] animated:NO];
}

- (void) goToVideosSection {
 
    VideoSectionViewController* videoSectionVC = [[VideoSectionViewController alloc] init];
    [self setViewControllers:@[videoSectionVC] animated:NO];
}

- (void) goToEventsSection {
    EventsSectionViewController* eventsSectionVC = [[EventsSectionViewController alloc] init];
    [self setViewControllers:@[eventsSectionVC] animated:NO];
}

- (void) goToPlacesSection {
    PlacesSectionViewController* placesSectionVC = [[PlacesSectionViewController alloc] init];
    [self setViewControllers:@[placesSectionVC] animated:NO];
}

- (void) goToSettings {
    NSLog(@"nav manager - settings sections");
}



- (void)didReceiveMeamoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
