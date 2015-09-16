//
//  VideoFactory.h
//  projectMustang-ios
//
//  Created by Ri Zhao on 2015-09-03.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DataFetcher.h"
#import "VideoDataModel.h"

@interface VideoFactory : NSObject

@property (nonatomic, strong) NSMutableArray* videoArray;

typedef void (^myCompletionBlock)(BOOL success, NSMutableArray *videos, NSError *error);

-(void) gatherData:(myCompletionBlock)completionBlock;

@end
