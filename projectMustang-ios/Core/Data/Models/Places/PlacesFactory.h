//
//  PlacesFactory.h
//  projectMustang-ios
//
//  Created by Ri Zhao on 2015-09-03.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DataFetcher.h"
#import "PlacesDataModel.h"

@interface PlacesFactory : NSObject

@property (nonatomic, strong) NSMutableArray* placesArray;

typedef void (^myCompletionBlock)(BOOL success, NSMutableArray *places, NSError *error);

-(void) gatherData:(myCompletionBlock)completionBlock;

@end
