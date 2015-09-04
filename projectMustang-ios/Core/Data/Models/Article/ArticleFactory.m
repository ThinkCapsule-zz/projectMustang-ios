//
//  TCArticleFactory.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-26.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticleFactory.h"

@implementation ArticleFactory

-(id)init{
    self = [super init];
   
    return self;
}

-(void)gatherData:(myCompletionBlock)completionBlock{
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithIdArticle:^(BOOL success, NSMutableArray *articles, NSError *error) {
        if (!success){
            completionBlock(NO, nil, error);
        }else {
            self.articleArray = [[NSMutableArray alloc]init];
            for (NSInteger i = articles.count-1; i >=0; i--){
                CDAEntry   *temp   = [articles objectAtIndex:i];
                
                if (temp.fields[@"headline"])
                {
                    ArticleDataModel *articleModel = [[ArticleDataModel alloc]init];
                    
                    articleModel.contentType = temp.fields[@"contentType"];
                    articleModel.articleId = temp.fields[@"articleId"];
                    articleModel.headline = temp.fields[@"headline"];
                    articleModel.subtitle = temp.fields[@"subtitle"];
                    articleModel.author = temp.fields[@"author"];
                    articleModel.body = temp.fields[@"body"];
                    articleModel.publishDate = temp.fields[@"publishDate"];
                    articleModel.thumbnails = temp.fields[@"thumbnails"];
                    articleModel.tags = temp.fields[@"tags"];
                    
                    [self.articleArray addObject:articleModel];
                }
            }
            
            NSMutableArray *temp = [self.articleArray objectAtIndex:0];
            if (!temp) {
                completionBlock(NO, nil, nil);
            }else{
                completionBlock(YES, self.articleArray, nil);
            }
            
        }
    }];
}


@end
