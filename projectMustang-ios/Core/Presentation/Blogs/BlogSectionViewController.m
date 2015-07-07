//
//  BlogListViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogSectionViewController.h"
#include "BlogCell.h"

@implementation BlogSectionViewController

#pragma mark - View Methods
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title          = @"Blogs";
    self.view           = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    blogFlowLayout      = [[UICollectionViewFlowLayout alloc] init];
    blogCollectionView  = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:blogFlowLayout];
    
    [blogCollectionView setDataSource:self];
    [blogCollectionView setDelegate:self];
    
    [blogCollectionView registerClass:[BlogCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    blogCollectionView.backgroundColor          = [UIColor colorWithWhite:1.0 alpha:0.4];
    blogCollectionView.alwaysBounceVertical     = YES;
    
    [self.view addSubview:blogCollectionView];
}

#pragma mark - UICollectionViewDataSource Delegate Methods
//this needs to be changed when bill's part is done
//- (void) loadEvents

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //setup reusable cell object
    BlogCell *cell = [blogCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"Blog Post #%ld", (long)indexPath.item];
    
    cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 190);
}

@end
