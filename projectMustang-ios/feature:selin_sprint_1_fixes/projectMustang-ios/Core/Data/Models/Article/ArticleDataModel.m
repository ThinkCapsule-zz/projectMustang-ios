//
//  TCArticleDataModel.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticleDataModel.h"

@implementation ArticleDataModel


-(id)initWithContentType:(NSString*)cType andArticleId:(NSString*)aId andHeadline:(NSString *)hline andSubtitle:(NSString *)stitle andAuthor:(NSString *)athor andBody:(NSString *)bdy andPublishDate:(NSDate *)pDate andThumbnails:(NSArray *)tNails andTags:(NSString *)tgs
{
    self = [super init];
    if(self){
        self.contentType = cType;
        self.articleId = aId;
        self.headline = hline;
        self.subtitle = stitle;
        self.author  = athor;
        self.body = bdy;
        self.publishDate = pDate;
        self.thumbnails = tNails;
        self.tags = tgs;
    }
    return self;
}

@end
