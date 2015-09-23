//
//  DataFetcher.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-05-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "DataFetcher.h"
#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>

@implementation DataFetcher


- (instancetype)init {
    
    self = [super init];
    
    if (self) {
   
        CDAConfiguration* config = [CDAConfiguration defaultConfiguration];
        config.server = @"preview.contentful.com";
        _fetchClient = [[CDAClient alloc] initWithSpaceKey:@"1oq1lgnwupsh" accessToken:@"ea40f4d68e1983a625ac5330daaaaee3befeda5a26dc4da674ccee3b5dec4037" configuration: config];
    }
    
    return self;
    
}

+(DataFetcher*)singletonInstance{
    
    static dispatch_once_t onceToken;
    static DataFetcher* singleton;
    
    dispatch_once(&onceToken, ^{
        singleton = [[DataFetcher alloc] init];
    });
    
    return singleton;
}

#pragma mark -
#pragma mark Fetch Methods

- (void) fetchWithIdArticle:(myCompletionBlock)completionBlock{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    
    [client fetchEntriesMatching:@{ contentType: articleContent}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.array];
                             if (!entries.items) {
                                 completionBlock(NO, nil, nil);
                             }else{
                                 completionBlock(YES, array, nil);
                             }
                             
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                             completionBlock(NO, nil, error);
                         }
     ];
}

- (void) fetchWithIdBlog:(myCompletionBlock)completionBlock{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    
    [client fetchEntriesMatching:@{ contentType: blogContent}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.array];
                             if (!entries.items) {
                                 completionBlock(NO, nil, nil);
                             }else{
                                 completionBlock(YES, array, nil);
                             }
                             
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                             completionBlock(NO, nil, error);
                         }
     ];
}

- (void) fetchWithIdEvent:(myCompletionBlock)completionBlock{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    
    [client fetchEntriesMatching:@{ contentType: eventContent}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.array];
                             if (!entries.items) {
                                 completionBlock(NO, nil, nil);
                             }else{
                                 completionBlock(YES, array, nil);
                             }
                             
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                             completionBlock(NO, nil, error);
                         }
     ];
}

- (void) fetchWithIdPlaces:(myCompletionBlock)completionBlock{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    
    [client fetchEntriesMatching:@{ contentType: placesContent}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.array];
                             if (!entries.items) {
                                 completionBlock(NO, nil, nil);
                             }else{
                                 completionBlock(YES, array, nil);
                             }
                             
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                             completionBlock(NO, nil, error);
                         }
     ];
}

- (void) fetchWithIdVideo:(myCompletionBlock)completionBlock{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    
    [client fetchEntriesMatching:@{ contentType: videoContent}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.array];
                             if (!entries.items) {
                                 completionBlock(NO, nil, nil);
                             }else{
                                 completionBlock(YES, array, nil);
                             }
                             
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                             completionBlock(NO, nil, error);
                         }
     ];
}


@end
