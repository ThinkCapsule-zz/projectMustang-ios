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

- (id)initWithContentType:(NSString*)cType andArticleId:(NSString*)aId andHeadline:(NSString *)hline andSubtitle:(NSString *)stitle andAuthor:(NSString *)athor andBody:(NSString *)bdy andPublishDate:(NSDate *)pDate andThumbnails:(NSArray *)tNails andTags:(NSString *)tgs
{
    self = [super init];
    if(self){
        contentType = cType;
        articleId = aId;
        headline = hline;
        subtitle = stitle;
        author  = athor;
        body = bdy;
        publishDate = pDate;
        thumbnails = tNails;
        tags = tgs;
    }
    return self;
}

@end
