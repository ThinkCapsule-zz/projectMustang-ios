//
//  TCArticleFactory.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-26.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "TCArticleFactory.h"

@implementation TCArticleFactory
@synthesize articleArray, articles;
-(id)init{
    self = [super init];
   
    return self;
}

-(NSMutableArray*)returnData{
    
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithId:^(BOOL success, NSMutableArray *article, NSError *error) {
        if(!success){
            NSLog(@"error");
        }else{
            articleArray = article;
            NSLog(@"here");
        }
        
    }
     ];
    return articleArray;
}

@end
