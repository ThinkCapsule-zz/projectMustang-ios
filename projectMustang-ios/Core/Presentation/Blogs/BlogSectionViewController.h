//
//  BlogListViewController.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"

@interface BlogSectionViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionViewFlowLayout *blogFlowLayout;
    UICollectionView *blogCollectionView;
}

@end
