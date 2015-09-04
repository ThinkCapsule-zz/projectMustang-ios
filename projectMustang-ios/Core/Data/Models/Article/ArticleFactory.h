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
#import "ArticleDataModel.h"

@interface ArticleFactory: NSObject

@property (nonatomic, strong) NSMutableArray* articleArray;

typedef void (^myCompletionBlock)(BOOL success, NSMutableArray *articles, NSError *error);

-(void) gatherData:(myCompletionBlock)completionBlock;

@end
