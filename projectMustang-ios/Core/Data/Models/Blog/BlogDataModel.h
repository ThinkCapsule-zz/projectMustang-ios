//
//  TCBlogDataModel.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogDataModel : NSObject

@property (nonatomic, strong) NSString* contentType;
@property (nonatomic, strong) NSString* blogId;
@property (nonatomic, strong) NSString* series;
@property (nonatomic, strong) NSString* blogDescription;
@property (nonatomic, strong) NSString* author;
@property (nonatomic, strong) NSString* body;
@property (nonatomic, strong) NSDate* publishDate;
@property (nonatomic, strong) NSArray* thumbnails;
@property (nonatomic, strong) NSArray* tags;


@end
