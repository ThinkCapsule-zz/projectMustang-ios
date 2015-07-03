//
//  EventsSectionViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "EventsSectionViewController.h"

@implementation EventsSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Events";
    self.view                           = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    eventsFlowLayout  = [[UICollectionViewFlowLayout alloc] init];
    eventsCollectionView                = [[UICollectionView alloc]
                                           initWithFrame:self.view.frame collectionViewLayout:eventsFlowLayout];
    [eventsCollectionView setDataSource:self];
    [eventsCollectionView setDelegate:self];
    [eventsCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    eventsCollectionView.backgroundColor = [UIColor brownColor];
    eventsCollectionView.alwaysBounceVertical = YES;
    [self.view addSubview:eventsCollectionView];
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
    
    cell.backgroundColor = [UIColor colorWithRed:25/255.0 green:55/255.0 blue:100/255.0 alpha:0.5];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 100);
}

@end
