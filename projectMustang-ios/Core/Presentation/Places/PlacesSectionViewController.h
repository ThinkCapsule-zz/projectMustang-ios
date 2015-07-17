//
//  PlacesSectionViewController.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"

@interface PlacesSectionViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) UICollectionViewFlowLayout    *placesFlowLayout;
@property (nonatomic) UICollectionView              *placesCollectionView;
@property (nonatomic) NSMutableArray                *placesImgArray;
@property (nonatomic) NSString                      *sourcePath;
-(void) loadPlacesCollectionView;
-(void) loadPlacesPictures;

@end
