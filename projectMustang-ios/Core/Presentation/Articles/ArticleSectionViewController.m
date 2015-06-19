//
//  ArticleListViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticleSectionViewController.h"

@implementation ArticleSectionViewController


#pragma mark - View Methods
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Articles";
    self.view.backgroundColor = [UIColor redColor];
}

#pragma mark - UICollectionViewDataSource Delegate Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
#warning TODO    
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    
#warning TODO
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
#warning TODO
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCell " forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}

@end
