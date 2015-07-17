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
    [self loadBlogCollectionView];
    [self loadBlogPictures];
    }


-(void) loadBlogCollectionView
{
    self.blogFlowLayout      = [[UICollectionViewFlowLayout alloc] init];
    self.blogCollectionView  = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.blogFlowLayout];
    
    [self.blogCollectionView setDataSource:self];
    [self.blogCollectionView setDelegate:self];
    
    [self.blogCollectionView registerClass:[BlogCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    self.blogCollectionView.backgroundColor          = [UIColor colorWithWhite:1.0 alpha:0.4];
    self.blogCollectionView.alwaysBounceVertical     = YES;
    
    [self.view addSubview:self.blogCollectionView];
}

-(void) loadBlogPictures
{
    self.blogImgArray   = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<10; i++) {
        [self.blogImgArray addObject:@"Miss"];
    }
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
    BlogCell *cell = [self.blogCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    [cell loadImages:[self.blogImgArray objectAtIndex:indexPath.row]];
    [cell loadLabel: [NSString stringWithFormat:@"Blog Post #%ld", (long)indexPath.item+1]];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 190);
}

@end
