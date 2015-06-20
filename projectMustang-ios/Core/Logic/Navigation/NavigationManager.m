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
#import "SettingsViewController.h"

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
}

#pragma mark - Onboarding Flow Methods
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

#pragma mark - Section Navigation
- (void) goToMainSectionWithAnimation:(BOOL)animated {
    
    [self setNavigationBarHidden:NO];
    MainViewController* mainSectionVC = [[MainViewController alloc] init];
    [self setViewControllers:@[mainSectionVC] animated:animated];
}

- (void) goToMainSection {
    [self goToMainSectionWithAnimation:YES];
}

- (void) goToArticleSection {
    
    ArticleSectionViewController* articleSectionVC = [[ArticleSectionViewController alloc] init];
    [self setViewControllers:@[articleSectionVC] animated:YES];
}

- (void) goToBlogSection {
    
    BlogSectionViewController* blogSectionVC = [[BlogSectionViewController alloc] init];
    [self setViewControllers:@[blogSectionVC] animated:YES];
}

- (void) goToVideosSection {
 
    VideoSectionViewController* videoSectionVC = [[VideoSectionViewController alloc] init];
    [self setViewControllers:@[videoSectionVC] animated:YES];
}

- (void) goToEventsSection {
    EventsSectionViewController* eventsSectionVC = [[EventsSectionViewController alloc] init];
    [self setViewControllers:@[eventsSectionVC] animated:YES];
}

- (void) goToPlacesSection {
    PlacesSectionViewController* placesSectionVC = [[PlacesSectionViewController alloc] init];
    [self setViewControllers:@[placesSectionVC] animated:YES];
}

- (void) goToSettings {
    SettingsViewController* settingsVC = [[SettingsViewController alloc] init];
    [self setViewControllers:@[settingsVC] animated:YES];
}


#pragma mark - Memory
- (void)didReceiveMeamoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
