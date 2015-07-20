//
//  PlacesSectionViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesSectionViewController.h"
#include "PlacesCell.h"
#import "PlacesDetailViewController.h"

@implementation PlacesSectionViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title              = @"Places";
    self.view               = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [self loadPlacesCollectionView];
    [self loadPlacesPictures];
}

- (void) loadPlacesCollectionView
{
    self.placesFlowLayout        = [[UICollectionViewFlowLayout alloc] init];
    self.placesCollectionView    = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.placesFlowLayout];
    
    [self.placesCollectionView setDataSource:self];
    [self.placesCollectionView setDelegate:self];
    
    [self.placesCollectionView registerClass:[PlacesCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    self.placesCollectionView.alwaysBounceVertical   = YES;
    
    self.placesCollectionView.backgroundView        = [[UIView alloc]initWithFrame:self.placesCollectionView.bounds];
    UIImageView *imgView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UWO"]];
    [self.view addSubview:self.placesCollectionView];
    [self.placesCollectionView.backgroundView addSubview:imgView];
}

-(void) loadPlacesPictures
{
    self.placesImgArray   = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<10; i++) {
        [self.placesImgArray addObject:@"Nova"];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}


- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}


//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlacesCell *cell = [self.placesCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];

    [cell loadImages:[self.placesImgArray objectAtIndex:indexPath.row]];
    [cell loadLabel: [NSString stringWithFormat:@"Some Place # %ld", (long)indexPath.item+1]];
    
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 190);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlacesDetailViewController *detVC = [[PlacesDetailViewController alloc] init];
    [self.navigationController pushViewController:detVC animated:YES];
}


@end
