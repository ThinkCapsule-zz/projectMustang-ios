//
//  NavigationManager.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface NavigationManager : UINavigationController

+ (NavigationManager* )singletonInstance;

/* Onboarding */
- (void) showLogin;
- (void) showWalkthrough;

/* Sections */
- (void) goToMainSection;
- (void) goToMainSectionWithAnimation:(BOOL)animated;

- (void) goToArticleSection;
- (void) goToBlogSection;
- (void) goToVideosSection;
- (void) goToEventsSection;
- (void) goToPlacesSection;

/* Settings */
- (void) goToSettings;

@end
