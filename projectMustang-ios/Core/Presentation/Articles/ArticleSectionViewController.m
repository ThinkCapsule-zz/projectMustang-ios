//
//  ArticleListViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticleSectionViewController.h"
#import "ArticleCell.h"
#import "ArticlesDetailViewController.h"


@implementation ArticleSectionViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    [self loadData];
    [self loadCollectionView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

#pragma mark - 
#pragma mark factory api function
-(void)loadData{
    ArticleFactory *fetch = [[ArticleFactory alloc]init];
    [fetch gatherData:^(BOOL success, NSMutableArray *articles, NSError *error) {
        if (!success){
            NSLog(@"%@", error);
        }else {
            self.gatherData = articles;
            [self.articleCollectionView reloadData];
            [self loadPictures];
        }
    }];
}

-(void) loadCollectionView
{
    self.articleFlow            = [[UICollectionViewFlowLayout alloc] init];
    self.articleCollectionView  = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.articleFlow];
    
    [self.articleCollectionView setDataSource:self];
    [self.articleCollectionView setDelegate:self];
    
    [self.articleCollectionView registerClass:[ArticleCell class] forCellWithReuseIdentifier:@"FlickrCell"];
    
    [self.articleCollectionView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.95]];
    self.articleCollectionView.alwaysBounceVertical  = YES;
    [self.view addSubview:self.articleCollectionView];
}

- (void) loadPictures
{
    self.articleArray   = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<self.gatherData.count; i++) {
        [self.articleArray addObject:@"alchii"];
    }
}

#pragma mark - UICollectionViewDataSource Delegate Methods

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
    ArticleDataModel *model = self.gatherData[indexPath.row];
    ArticleCell *cell   = (ArticleCell*)[self.articleCollectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    [cell initWithData:model];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 180);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ArticlesDetailViewController *detVC = [[ArticlesDetailViewController alloc] initWithData:self.gatherData[indexPath.row]];
    [self.navigationController pushViewController:detVC animated:YES];
}

@end