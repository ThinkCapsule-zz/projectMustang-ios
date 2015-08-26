//
//  TCVideoDataModel.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoDataModel : NSObject

@property (nonatomic, strong) NSString* contentType;
@property (nonatomic, strong) NSString* contentId;
@property (nonatomic, strong) NSString* seriesId;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* url;
@property (nonatomic, strong) NSArray* thumbnails;
@property (nonatomic, strong) NSArray* tags;

@end
