//
//  DataFetcher.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-05-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>
#import "DataFetcherStatics.h"
#import "ArticleDataModel.h"
#import "BlogDataModel.h"
#import "EventDataModel.h"
#import "PlacesDataModel.h"
#import "VideoDataModel.h"

@interface DataFetcher : NSObject

@property (nonatomic, strong) CDAClient* fetchClient;
@property (nonatomic, strong) NSArray* array;
//section arrays
@property (nonatomic, strong) NSMutableArray* articleArray;
@property (nonatomic, strong) NSMutableArray* blogArray;
@property (nonatomic, strong) NSMutableArray* eventsArray;
@property (nonatomic, strong) NSMutableArray* placesArray;
@property (nonatomic, strong) NSMutableArray* videoArray;

@property (nonatomic, strong) NSMutableArray* fetchArticle;

//completionBlock
typedef void (^myCompletionBlock)(BOOL success, NSMutableArray *articles, NSError *error);

+(DataFetcher*)singletonInstance;

//fetch functions
#pragma mark -
#pragma mark fetch functions
- (void) fetchWithIdArticle:(myCompletionBlock)completionBlock;
- (void) fetchWithIdBlog:(myCompletionBlock)completionBlock;
- (void) fetchWithIdEvent:(myCompletionBlock)completionBlock;
- (void) fetchWithIdPlaces:(myCompletionBlock)completionBlock;
- (void) fetchWithIdVideo:(myCompletionBlock)completionBlock;
@end
