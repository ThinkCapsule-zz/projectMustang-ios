//
//  ArticleListViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticleSectionViewController.h"
#include "ArticleCell.h"

@implementation ArticleSectionViewController


#pragma mark - View Methods

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title                  = @"Articles";
    self.view                   = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self loadPictures];

    
    self.articleFlow                 = [[UICollectionViewFlowLayout alloc] init];
    self.articleCollectionView       = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.articleFlow];
    
    [self.articleCollectionView setDataSource:self];
    [self.articleCollectionView setDelegate:self];
    
    [self.articleCollectionView registerClass:[ArticleCell class] forCellWithReuseIdentifier:@"FlickrCell"];
    
    [self.articleCollectionView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.4]];
    self.articleCollectionView.alwaysBounceVertical  = YES;
    [self.view addSubview:self.articleCollectionView];
}

- (void) loadPictures
{
    self.sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"FillPics"];
    self.articleArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.sourcePath error:NULL];
}


#pragma mark - UICollectionViewDataSource Delegate Methods

//would I be changing the number of collectionviews or the number of sections (based on the number of articles) ?
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.articleArray.count;
}

//number of sections
- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //setup cell
    ArticleCell *cell   = [self.articleCollectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    
    //populate with images
    NSString    *imageName      = [self.articleArray objectAtIndex:indexPath.row];
    NSString    *filename       = [NSString stringWithFormat:@"%@/%@", self.sourcePath, imageName];
    UIImage     *image          = [UIImage imageWithContentsOfFile:filename];
    UIImageView *photoImageView = [[UIImageView alloc] initWithImage:image];
    
    //resize image

    photoImageView.frame            = CGRectMake(photoImageView.frame.origin.x, photoImageView.frame.origin.y, self.view.frame.size.width, 190);
    photoImageView.contentMode      = UIViewContentModeBottomLeft; // This determines position of image
    photoImageView.clipsToBounds    = YES;
    [cell addSubview:photoImageView];
    
    cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    cell.label.text = [NSString stringWithFormat:@"Article %ld", (long)indexPath.item];
    
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 190);
}

@end