//
//  PlacesSectionViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesSectionViewController.h"
#include "PlacesCell.h"

@implementation PlacesSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title              = @"Places";
    self.view               = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    placesFlowLayout        = [[UICollectionViewFlowLayout alloc] init];
    placesCollectionView    = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:placesFlowLayout];
    
    
    [placesCollectionView setDataSource:self];
    [placesCollectionView setDelegate:self];
    
    [placesCollectionView registerClass:[PlacesCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    placesCollectionView.alwaysBounceVertical   = YES;
    
    placesCollectionView.backgroundView        = [[UIView alloc]initWithFrame:placesCollectionView.bounds];
    UIImageView *imgView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UWO"]];
    //why doesnt the placesCOllectionView.backgroundColor not work ? is it not an overlay over the imgview?
    //placesCollectionView.backgroundColor        = [UIColor colorWithWhite:1.0 alpha:0.9];

    [placesCollectionView.backgroundView addSubview:imgView];
    [self.view addSubview:placesCollectionView];
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
    PlacesCell *cell = [placesCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"Some Place # %ld", (long)indexPath.item+1];
    
    //populate with mock data
  /*
    NSString *imageName = [placesArray objectAtIndex:indexPath.row];
    NSString *filename = [NSString stringWithFormat:@"%@/%@", sourcePath, imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:filename];
    UIImageView *photoImageView = [[UIImageView alloc] initWithImage:image];
    */
    
    cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 100);
}


@end
