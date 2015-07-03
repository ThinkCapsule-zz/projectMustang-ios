//
//  PlacesSectionViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesSectionViewController.h"

@implementation PlacesSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Places";
    self.view                           = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    placesFlowLayout  = [[UICollectionViewFlowLayout alloc] init];
    placesCollectionView                = [[UICollectionView alloc]
                                           initWithFrame:self.view.frame collectionViewLayout:placesFlowLayout];
    [placesCollectionView setDataSource:self];
    [placesCollectionView setDelegate:self];
    [placesCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    placesCollectionView.backgroundColor = [UIColor purpleColor];
    placesCollectionView.alwaysBounceVertical = YES;
    [self.view addSubview:placesCollectionView];
}


//should be number of array items (in an array that holds number of event posts) unless it's in a large collection, then I guess we can just give it an arbitrary number, that can be reloaded when scrolled to the bottom - like an instagram feed
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

//number of items in each section ~~~~~~~~~~~~~~~~ WHY DOESN"T THIS WORK?

- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}


//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:125/255.0 green:66/255.0 blue:50/255.0 alpha:0.5];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 100);
}










@end
