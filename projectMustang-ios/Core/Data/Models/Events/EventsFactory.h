//
//  EventsFactory.h
//  projectMustang-ios
//
//  Created by Ri Zhao on 2015-09-03.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DataFetcher.h"
#import "EventDataModel.h"

@interface EventsFactory : NSObject

@property (nonatomic, strong) NSMutableArray* eventArray;

typedef void (^myCompletionBlock)(BOOL success, NSMutableArray *events, NSError *error);

-(void) gatherData:(myCompletionBlock)completionBlock;

@end
