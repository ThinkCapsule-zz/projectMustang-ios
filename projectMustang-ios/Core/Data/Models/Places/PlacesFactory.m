//
//  PlacesFactory.m
//  projectMustang-ios
//
//  Created by Ri Zhao on 2015-09-03.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesFactory.h"

@implementation PlacesFactory


-(id)init{
    self = [super init];
    
    return self;
}

-(void)gatherData:(myCompletionBlock)completionBlock{
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithIdPlaces:^(BOOL success, NSMutableArray *places, NSError *error) {
        if (!success){
            completionBlock(NO, nil, error);
        }else {
            self.placesArray = [[NSMutableArray alloc]init];
            for (NSInteger i = places.count-1; i >=0; i--){
                CDAEntry   *temp   = [places objectAtIndex:i];
                
                if (temp.fields[@"placeid"])
                {
                    PlacesDataModel *placesModel = [[PlacesDataModel alloc]init];
                    
                    placesModel.contentType = temp.fields[@"contentType"];
                    placesModel.locationName = temp.fields[@"locationName"];
                    placesModel.locationId = temp.fields[@"locationId"];
                    placesModel.Location = temp.fields[@"location"];
                    placesModel.phone = temp.fields[@"phoneNumber"];
                    placesModel.address = temp.fields[@"address"];
                    placesModel.thumbnails = temp.fields[@"thumbnails"];
                    placesModel.tags = temp.fields[@"tags"];
                    
                    [self.placesArray addObject:placesModel];
                }
            }
            
            NSMutableArray *temp = [self.placesArray objectAtIndex:0];
            if (!temp) {
                completionBlock(NO, nil, nil);
            }else{
                completionBlock(YES, self.placesArray, nil);
            }
            
        }
    }];
}


@end
