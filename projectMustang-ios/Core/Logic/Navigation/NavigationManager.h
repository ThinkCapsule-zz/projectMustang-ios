//
//  NavigationManager.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-04-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationManager : UINavigationController

+ (NavigationManager* )singletonInstance;

/* Sections */
- (void) goToMainSection;
- (void) goToArticleSection;
- (void) goToBlogSection;
- (void) goToVideosSection;
- (void) goToEventsSection;
- (void) goToPlacesSection;

/* Settings */
- (void) goToSettings;

@end
