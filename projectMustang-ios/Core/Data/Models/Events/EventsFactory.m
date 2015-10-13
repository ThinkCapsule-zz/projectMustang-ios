//
//  EventsFactory.m
//  projectMustang-ios
//
//  Created by Ri Zhao on 2015-09-03.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "EventsFactory.h"

@implementation EventsFactory

-(id)init{
    self = [super init];
    
    return self;
}

-(void)gatherData:(myCompletionBlock)completionBlock{
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithIdEvent:^(BOOL success, NSMutableArray *events, NSError *error) {
        if (!success){
            completionBlock(NO, nil, error);
        }else {
            self.eventArray = [[NSMutableArray alloc]init];
            for (NSInteger i = events.count-1; i >=0; i--){
                CDAEntry   *temp   = [events objectAtIndex:i];
                
                if (temp.fields[@"eventId"])
                {
                    EventDataModel *eventModel = [[EventDataModel alloc]init];
                    
                    eventModel.contentType  = temp.fields[@"contentType"];
                    eventModel.eventId      = temp.fields[@"eventId"];
                    eventModel.eventName    = temp.fields[@"eventName"];
                    eventModel.eventDescription = temp.fields[@"eventDescription"];
                    eventModel.location     = temp.fields[@"location"];
                    eventModel.restrictions = temp.fields[@"restriction"];
                    eventModel.thumbnails   = temp.fields[@"thumbnails"];
                    eventModel.tags         = temp.fields[@"tags"];
                    eventModel.eventDate    = temp.fields[@"eventDate"];
                    [self.eventArray addObject:eventModel];

                }
            }
            
            NSMutableArray *temp = [self.eventArray objectAtIndex:0];
            if (!temp) {
                completionBlock(NO, nil, nil);
            }else{
                completionBlock(YES, self.eventArray, nil);
            }
            
        }
    }];
}

@end
