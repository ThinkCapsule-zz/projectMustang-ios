//
//  BlogListViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogSectionViewController.h"
#import "BlogCell.h"
#import "BlogsDetailViewController.h"

@implementation BlogSectionViewController

#pragma mark - View Methods
- (void)viewDidLoad {
    
    [super viewDidLoad];
//    self.view           = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    [self loadData];


    }

- (void)viewWillAppear:(BOOL)animated{
[super viewWillAppear:YES];
}

-(void)loadData{
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithIdBlog:^(BOOL success, NSMutableArray *blogPosts, NSError *error) {
        if (!success){
            NSLog(@"%@", error);
        }else {
            self.gatherData = blogPosts;
            [self.blogCollectionView reloadData];
            [self loadBlogCollectionView];
            [self loadBlogPictures];
            
        }
    }];
}

-(void) loadBlogCollectionView
{
    self.blogFlowLayout      = [[UICollectionViewFlowLayout alloc] init];
    self.blogCollectionView  = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.blogFlowLayout];
    
    [self.blogCollectionView setDataSource:self];
    [self.blogCollectionView setDelegate:self];
    
    [self.blogCollectionView registerClass:[BlogCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    self.blogCollectionView.backgroundColor          = [UIColor colorWithWhite:1.0 alpha:1.0];
    self.blogCollectionView.alwaysBounceVertical     = YES;
    
    [self.view addSubview:self.blogCollectionView];
}

-(void) loadBlogPictures
{
    self.blogImgArray   = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<self.gatherData.count; i++) {
        [self.blogImgArray addObject:@"Miss"];
    }
}

#pragma mark - UICollectionViewDataSource Delegate Methods
//this needs to be changed when bill's part is done
//- (void) loadEvents



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.blogImgArray.count;
}

- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BlogDataModel *model = self.gatherData[indexPath.row];
    //setup reusable cell object
    BlogCell *cell = [self.blogCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
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
    BlogDataModel *model = self.gatherData[indexPath.row];
    BlogsDetailViewController *detVC = [[BlogsDetailViewController alloc] initWithData:model];
    [self.navigationController pushViewController:detVC animated:YES];
}


@end
