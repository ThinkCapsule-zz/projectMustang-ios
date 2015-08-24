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
    self.view           = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    [self loadBlogCollectionView];
    [self loadBlogPictures];
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
    for (NSInteger i = 0; i<10; i++) {
        [self.blogImgArray addObject:@"Miss"];
    }
}

#pragma mark - UICollectionViewDataSource Delegate Methods
//this needs to be changed when bill's part is done
//- (void) loadEvents



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //setup reusable cell object
    BlogCell *cell = [self.blogCollectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    [cell loadImages:[self.blogImgArray objectAtIndex:indexPath.row]];
    [cell loadLabels: [NSString stringWithFormat:@"Blog Post #%ld", (long)indexPath.item+1]
                    : [NSString stringWithFormat:@"A 54 character summary of the associated blog post."]
                    : [NSString stringWithFormat:@"Western Mustang"]];
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 190);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BlogsDetailViewController *detVC = [[BlogsDetailViewController alloc] init];
    [self.navigationController pushViewController:detVC animated:YES];
    [detVC loadData:[NSString stringWithFormat:@"BlogPost %ld", (long)indexPath.item]
                   :[NSString stringWithFormat:@"Western Mustang"]
                   :[NSString stringWithFormat:@"photo by xxxxx"]
                   :[NSString stringWithFormat:@"SO like something something fets cheese and gross stuff but like yeah and wine and chocolate but like also this and that and things and stuff. so like how could he!!!! couldn't freaking believe this. shouldn't I just not do this ever and stuff but liek typing is loud and annoying people is my FORTE @&&@ fbajfb ahihihihi justin timerlake. turtle remixes like trippy turtle. turtles have hard shells and shit. they get old and stuff, like I'm tlaking ancientttt. but not really ancient because that would be a lot older than what they actually live until. 'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha'what do yo think?' 'I LIKE TURTLES!'ajhahahahhahahahahahahahahahahhahahahahahahahahahahahahahhahahahahahahahhahahahahahhahahhahahahahhahahahahhahahahahahhahaha"]
                   :[self.blogImgArray objectAtIndex:indexPath.row]];
}


@end
