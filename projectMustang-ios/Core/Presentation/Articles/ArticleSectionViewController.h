//
//  ArticleListViewController.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"

@interface ArticleSectionViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    
}
@property (nonatomic) UICollectionViewFlowLayout    *articleFlow;
@property (nonatomic) UICollectionView              *articleCollectionView;
@property (nonatomic) NSArray                       *articleArray;
@property (nonatomic) NSString                      *sourcePath;
@property (nonatomic) NSArray                       *eventsArray;
-(void) loadPictures;
@end
