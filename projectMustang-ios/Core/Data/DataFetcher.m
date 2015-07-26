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

- (void) fetchWithId{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    [client fetchEntriesMatching:@{ @"content_type": @"1or7CAktokKiIUogkmU8O4"}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSLog(@"%@", self.array);
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                         }];
}

@end
