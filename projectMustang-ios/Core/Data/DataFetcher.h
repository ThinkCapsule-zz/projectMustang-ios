//
//  DataFetcher.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-05-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>
#import "TCArticleDataModel.h"
#import "TCBlogDataModel.h"

@interface DataFetcher : NSObject

@property (nonatomic, strong) CDAClient* fetchClient;
@property (nonatomic, strong) NSArray* array;

+(DataFetcher*)singletonInstance;

- (void) fetchWithId;
@end
