//
//  TCBlogDataModel.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogDataModel.h"

@implementation BlogDataModel

-(id)initWithContent: (NSString*)cType andBlogId:(NSString*)blgId andSeries:(NSString*)siri andDescrip:(NSString*)blogDes andAuthor:(NSString*)author andBody:(NSString*)cBody andDate:(NSDate*)pubDate andThumbs:(NSArray*)tNails andTags:(NSArray*)tag
{
    self = [super init];
    if(self){
        self.contentType = cType;
        self.blogId = blgId;
        self.series = siri;
        self.blogDescription = blogDes;
        self.author = author;
        self.body = cBody;
        self.publishDate = pubDate;
        self.thumbnails = tNails;
        self.tags = tag;
        NSLog(@"%@", self.author);
    }
    
    return self;
}

@end
