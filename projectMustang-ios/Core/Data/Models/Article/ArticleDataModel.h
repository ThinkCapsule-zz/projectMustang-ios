//
//  TCArticleDataModel.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>

@interface ArticleDataModel : NSObject

@property (nonatomic, strong) NSString* contentType;
@property (nonatomic, strong) NSString* articleId;
@property (nonatomic, strong) NSString* headline;
@property (nonatomic, strong) NSString* subtitle;
@property (nonatomic, strong) NSString* author;
@property (nonatomic, strong) NSString* body;
@property (nonatomic, strong) NSDate* publishDate;
@property (nonatomic, strong) NSArray* thumbnails;
@property (nonatomic, strong) NSString* tags;


@end
