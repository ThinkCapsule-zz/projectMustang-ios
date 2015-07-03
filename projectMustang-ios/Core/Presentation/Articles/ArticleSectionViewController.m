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
    self.title                          = @"Articles";
    self.view                           = [[UIView alloc]
    
    initWithFrame:[[UIScreen mainScreen] bounds]];
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc] init];
    articleCollectionView                      = [[UICollectionView alloc]
                                           initWithFrame:self.view.frame collectionViewLayout:layout];
    [articleCollectionView setDataSource:self];
    [articleCollectionView setDelegate:self];
    [articleCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [articleCollectionView setBackgroundColor:[UIColor blueColor]];
    articleCollectionView.alwaysBounceVertical = YES;
    [self.view addSubview:articleCollectionView];

}

#pragma mark - UICollectionViewDataSource Delegate Methods

//should be number of array items (in an array that holds number of article posts) unless it's a large collection, then I guess we can just give it an arbitrary number,t hat can be reloaded when scrolled tot he bottom - like an instagram feed
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:200/255.0 green:55/255.0 blue:12/255.0 alpha:0.4];
    return cell;
}


//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 100);
}

@end