//
//  BlogListViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogSectionViewController.h"

@implementation BlogSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title                          = @"Blogs";
    self.view                           = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    blogFlowLayout  = [[UICollectionViewFlowLayout alloc] init];
    blogCollectionView                      = [[UICollectionView alloc]
                                           initWithFrame:self.view.frame collectionViewLayout:blogFlowLayout];
    [blogCollectionView setDataSource:self];
    [blogCollectionView setDelegate:self];
    [blogCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [blogCollectionView setBackgroundColor:[UIColor redColor]];
    blogCollectionView.alwaysBounceVertical = YES;
    [self.view addSubview:blogCollectionView];
}


//should be number of array items (in an array that holds number of blog posts) unless it's in a large collection, then I guess we can just give it an arbitrary number,t hat can be reloaded when scrolled tot he bottom - like an instagram feed
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
    
    cell.backgroundColor = [UIColor colorWithRed:50/255.0 green:55/255.0 blue:50/255.0 alpha:0.4];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 100);
}

@end
