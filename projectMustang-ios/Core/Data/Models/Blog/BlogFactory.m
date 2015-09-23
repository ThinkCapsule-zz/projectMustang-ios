//
//  BlogFactory.m
//  projectMustang-ios
//
//  Created by Ri Zhao on 2015-09-03.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogFactory.h"

@implementation BlogFactory

-(id)init{
    self = [super init];
    
    return self;
}

-(void)gatherData:(myCompletionBlock)completionBlock{
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithIdBlog:^(BOOL success, NSMutableArray *blogs, NSError *error) {
        if (!success){
            completionBlock(NO, nil, error);
        }else {
            self.blogArray = [[NSMutableArray alloc]init];
            for (NSInteger i = blogs.count-1; i >=0; i--){
                CDAEntry   *temp   = [blogs objectAtIndex:i];
                
                if (temp.fields[@"blogId"])
                {
                    BlogDataModel *blogModel = [[BlogDataModel alloc]init];
                    
                    blogModel.contentType   = temp.fields[@"contentType"];
                    blogModel.blogId        = temp.fields[@"blogId"];
                    blogModel.series        = temp.fields[@"seriesName"];
                    blogModel.blogDescription = temp.fields[@"descrption"];
                    blogModel.author        = temp.fields[@"author"];
                    blogModel.body          = temp.fields[@"body"];
                    blogModel.publishDate   = temp.fields[@"publishDate"];
                    blogModel.thumbnails    = temp.fields[@"thumbnails"];
                    blogModel.tags          = temp.fields[@"tags"];
                    
                    [self.blogArray addObject:blogModel];
                    NSLog(@"%@", self.blogArray[0]);
                }
            }
            
            NSMutableArray *temp = [self.blogArray objectAtIndex:0];
            if (!temp) {
                completionBlock(NO, nil, nil);
            }else{
                completionBlock(YES, self.blogArray, nil);
            }
            
        }
    }];
}


@end
