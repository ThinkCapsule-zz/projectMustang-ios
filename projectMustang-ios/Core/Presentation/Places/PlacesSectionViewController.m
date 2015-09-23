//
//  PlacesSectionViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "PlacesSectionViewController.h"
#include "PlacesCell.h"
#import "PlacesDetailViewController.h"

@implementation PlacesSectionViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title              = @"Places";
    self.view               = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filter"]
                                                               landscapeImagePhone:nil
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];

    self.navigationItem.rightBarButtonItem.tintColor             = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.4];
    
    [self loadPlacesCollectionView];
    [self loadPlacesPictures];
}

- (void) loadPlacesCollectionView
{
    self.placesFlowLayout        = [[UICollectionViewFlowLayout alloc] init];
    self.placesCollectionView    = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.placesFlowLayout];
    [self.placesCollectionView setDataSource:self];
    [self.placesCollectionView setDelegate:self];
    [self.placesCollectionView registerClass:[PlacesCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    self.placesCollectionView.alwaysBounceVertical  = YES;
    self.placesCollectionView.backgroundColor       = [UIColor colorWithWhite:1.0 alpha:0.97];
    [self.view addSubview:self.placesCollectionView];
}

-(void) loadPlacesPictures
{
    self.placesImgArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<10; i++) {
        [self.placesImgArray addObject:@"Nova"];
    }
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
    PlacesCell *cell = [self.placesCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier"
                                                                            forIndexPath:indexPath];

    [cell loadImages:[self.placesImgArray objectAtIndex:indexPath.row]];
    double rating = 3.4;
    [cell loadLabels: [NSString stringWithFormat:@"Some Place # %ld", (long)indexPath.item+1] : rating];
    
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 113);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlacesDetailViewController *detVC = [[PlacesDetailViewController alloc] init];
    [self.navigationController pushViewController:detVC animated:YES];
    

    
    NSString *placeType       = @"restauraunt/Cafe";
    NSString *address       = @"123 essex street West, London, ON, M6G 1k4";
    NSString *phone         = @"+1 647-342-9229";
    NSString *hours          = @"Open Today. 7:30 am-12:00 am";
    NSString *rating           = @"3.0";
    NSString *numofratings = @"8 ratings";
    NSString *about            = @"About\n We have the best pizza you'll ever have. right next to ladida and tatata, it's also the best location in london! open 24/7 to satisfy all your cravings, whenever they may be. yaaaaayayayayayyayayayayayayayyayayyayaya";
    
    [detVC loadData:[NSString stringWithFormat:@"Some Place"]
                   :placeType
                   :address
                   :phone
                   :hours
                   :rating
                   :numofratings
                   :about];
}


@end
