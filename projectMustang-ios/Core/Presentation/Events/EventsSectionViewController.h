//
//  EventsSectionViewController.h
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BaseViewController.h"

@interface EventsSectionViewController : BaseViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>
{
    UICollectionViewFlowLayout *eventsFlowLayout;
    UICollectionView    *eventsCollectionView;
}

@end
