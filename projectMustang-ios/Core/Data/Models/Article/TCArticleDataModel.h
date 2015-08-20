//
//  TCArticleDataModel.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataFetcher.h"

@interface TCArticleDataModel : NSObject

@property (nonatomic, strong) NSString* contentType;
@property (nonatomic, strong) NSString* articleId;
@property (nonatomic, strong) NSString* headline;
@property (nonatomic, strong) NSString* subtitle;
@property (nonatomic, strong) NSString* author;
@property (nonatomic, strong) NSString* body;
@property (nonatomic, strong) NSDate* publishDate;
@property (nonatomic, strong) NSArray* thumbnails;
@property (nonatomic, strong) NSString* tags;


#pragma mark -
#pragma mark Class Methods

- (id)initWithContentType: (NSString*)cType andArticleId: (NSString*)aId andHeadline: (NSString *)hline andSubtitle: (NSString *)stitle andAuthor: (NSString *)athor andBody: (NSString *)bdy andPublishDate: (NSDate *)pDate andThumbnails: (NSArray *)tNails andTags: (NSString *)tgs;

@end
