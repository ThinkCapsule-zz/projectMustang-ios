//
//  BlogListViewController.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"
#import "DataFetcher.h"
@interface BlogSectionViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionViewFlowLayout    *blogFlowLayout;
@property (nonatomic) UICollectionView              *blogCollectionView;
@property (nonatomic) NSMutableArray                *blogImgArray;
@property (nonatomic) NSMutableArray                *blogArray;
@property (nonatomic) NSString                      *sourcePath;
@property (nonatomic, strong)NSMutableArray         *gatherData;

@property (nonatomic, strong) NSMutableArray *temp;

-(void) loadBlogCollectionView;
-(void) loadBlogPictures;
-(void) loadData;

@end
