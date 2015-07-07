//
//  EventsSectionViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "EventsSectionViewController.h"
#import "NavigationManager.h"
#include "EventsCell.h"

@implementation EventsSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title              = @"Events";
    self.view               = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    eventsFlowLayout        = [[UICollectionViewFlowLayout alloc] init];
    eventsCollectionView    = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:eventsFlowLayout];
    
    [eventsCollectionView setDataSource:self];
    [eventsCollectionView setDelegate:self];
    
    [eventsCollectionView registerClass:[EventsCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    eventsCollectionView.backgroundColor        = [UIColor colorWithWhite:1.0 alpha:0.4];
    eventsCollectionView.alwaysBounceVertical   = YES;
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];

    [self.view addSubview:eventsCollectionView];
}

//this needs to be changed when bill's part is done
//- (void) loadEvents


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //this needs to be changed when bill's part is done
    return 1;
}

//number of rows in each section
- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}


//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventsCell *cell = [eventsCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"Best Party Ever # %ld", (long)indexPath.item+1];
    cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 100);
}

@end
