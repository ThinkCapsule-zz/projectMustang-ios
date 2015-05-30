//
//  DataFetcher.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-05-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "DataFetcher.h"

@implementation DataFetcher

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        _fetchClient = [[CDAClient alloc] initWithSpaceKey:@"1oq1lgnwupsh" accessToken:@"15fb8db3a77203b19bacfd6589be0cf3630c3d7ef3c035049785bf2fc43c8c42"];
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

@end
