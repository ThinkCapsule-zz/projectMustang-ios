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
#import "EventsDetailViewController.h"

@implementation EventsSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title              = @"Events";
//    self.view               = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    [self loadEventCollectionView];
    [self loadData];
   }

-(void)loadData{
    EventsFactory *fetch = [[EventsFactory alloc]init];
    [fetch gatherData:^(BOOL success, NSMutableArray *events, NSError *error) {
        if (!success)
        {
            NSLog(@"%@", error);
        }
        else
        {
            self.gatherData = events;
            [self.eventsCollectionView reloadData];
            [self loadEventPictures];
        }
    }];
}

-(void) loadEventCollectionView
{
    
    self.eventsFlowLayout        = [[UICollectionViewFlowLayout alloc] init];
    self.eventsCollectionView    = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.eventsFlowLayout];
    
    [self.eventsCollectionView setDataSource:self];
    [self.eventsCollectionView setDelegate:self];
    
    [self.eventsCollectionView registerClass:[EventsCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    self.eventsCollectionView.backgroundColor        = [UIColor colorWithWhite:1.0 alpha:1.0];
    self.eventsCollectionView.alwaysBounceVertical   = YES;
    
    
    [self.view addSubview:self.eventsCollectionView];
}
-(void) loadEventPictures
{
    self.eventsImgArray   = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<10; i++) {
        [self.eventsImgArray addObject:@"Eve"];
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.gatherData.count;
}

//number of rows in each section
- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}


//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventsCell *cell = [self.eventsCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell initWithData:self.gatherData[indexPath.row]];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   EventsDetailViewController *detVC = [[EventsDetailViewController alloc] initWithData:self.gatherData[indexPath.row]];
    [self.navigationController pushViewController:detVC animated:YES];
}

@end
