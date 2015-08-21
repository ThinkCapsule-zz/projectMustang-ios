//
//  TCArticleDataModel.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "TCArticleDataModel.h"

@implementation TCArticleDataModel

@synthesize contentType, articleId, headline, subtitle, author, body, publishDate, thumbnails, tags;

- (instancetype) init {
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithId];
    return self;
}

@end
