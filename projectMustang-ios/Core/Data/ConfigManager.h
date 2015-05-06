//
//  ConfigManager.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-05-06.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigManager : NSObject

+(ConfigManager*)singletonInstance;

- (NSArray*) navigationItems;

@end
