//
//  TCEventDataModel.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDataModel : NSObject

@property (nonatomic, strong) NSString* contentType;
@property (nonatomic, strong) NSString* eventId;
@property (nonatomic, strong) NSString* eventName;
@property (nonatomic, strong) NSDate*   eventDate;
@property (nonatomic, strong) NSString* eventDescription;
@property (nonatomic, strong) NSString* location;
@property (nonatomic, strong) NSArray* restrictions;
@property (nonatomic, strong) NSArray*  thumbnails;
@property (nonatomic, strong) NSArray*  tags;

@end
