//
//  TCArticleFactory.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-26.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DataFetcher.h"

@interface TCArticleFactory: NSObject
@property (nonatomic, strong) NSMutableArray* articleArray;
@property (nonatomic, strong) NSMutableArray* articles;

-(NSMutableArray*) returnData;

@end
