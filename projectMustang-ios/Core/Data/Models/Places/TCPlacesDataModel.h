//
//  TCPlacesDataModel.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-01.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCPlacesDataModel : NSObject

@property (nonatomic, strong) NSString* contentType;
@property (nonatomic, strong) NSString* locationName;
@property (nonatomic, strong) NSString* locationId;
@property (nonatomic, strong) NSString* Location;
@property (nonatomic, strong) NSString* phone;
@property (nonatomic, strong) NSString* address;
@property (nonatomic, strong) NSArray* thumnail;
@property (nonatomic, strong) NSArray* tags;

@end
