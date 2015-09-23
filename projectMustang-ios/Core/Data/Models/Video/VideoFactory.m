//
//  VideoFactory.m
//  projectMustang-ios
//
//  Created by Ri Zhao on 2015-09-03.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "VideoFactory.h"

@implementation VideoFactory

-(id)init{
    self = [super init];
    
    return self;
}

-(void)gatherData:(myCompletionBlock)completionBlock{
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithIdPlaces:^(BOOL success, NSMutableArray *videos, NSError *error) {
        if (!success){
            completionBlock(NO, nil, error);
        }else {
            self.videoArray = [[NSMutableArray alloc]init];
            for (NSInteger i = videos.count-1; i >=0; i--){
                CDAEntry   *temp   = [videos objectAtIndex:i];
                
                if (temp.fields[@"videoId"])
                {
                    VideoDataModel *videoModel = [[VideoDataModel alloc]init];
                    
                    videoModel.contentId = temp.fields[@"videoId"];
                    videoModel.seriesId = temp.fields[@"seriesName"];
                    videoModel.title = temp.fields[@"title"];
                    videoModel.url = temp.fields[@"url"];
                    videoModel.thumbnails = temp.fields[@"thumbnails"];
                    videoModel.tags = temp.fields[@"tags"];
                    
                    [self.videoArray addObject:videoModel];
                }
            }
            
            NSMutableArray *temp = [self.videoArray objectAtIndex:0];
            if (!temp) {
                completionBlock(NO, nil, nil);
            }else{
                completionBlock(YES, self.videoArray, nil);
            }
            
        }
    }];
}

@end
