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

@interface ArticleSectionViewController(){
    TCArticleFactory *factory;
}

@end
@implementation ArticleSectionViewController
@synthesize temp;

#pragma mark - View Methods

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title                  = @"Articles";
    self.view                   = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self reloadData];
    [self loadCollectionView];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //[self reloadData];
}

-(void)reloadData{
    DataFetcher *fetch = [[DataFetcher alloc]init];
    [fetch fetchWithId:^(BOOL success, NSMutableArray *article, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!success){
                NSLog(@"error");
            }else{
                self.articleArray = article;
                //[self.table reloadData];
                [self loadPictures];

                
            }
        });
    }];

}


-(void) loadCollectionView
{
    self.articleFlow            = [[UICollectionViewFlowLayout alloc] init];
    self.articleCollectionView  = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.articleFlow];
    
    [self.articleCollectionView setDataSource:self];
    [self.articleCollectionView setDelegate:self];
    
    [self.articleCollectionView registerClass:[ArticleCell class] forCellWithReuseIdentifier:@"FlickrCell"];
    
    [self.articleCollectionView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.4]];
    self.articleCollectionView.alwaysBounceVertical  = YES;
    [self.view addSubview:self.articleCollectionView];
}

- (void) loadPictures
{

    self.picArray   = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<10; i++) {
        [self.picArray addObject:@"alchii"];
    }

}

#pragma mark - UICollectionViewDataSource Delegate Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
    
    
}

//number of sections
- (NSInteger) numOfSectionsCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//populates each cell with whatever is in the arraycell indexpath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleCell *cell   = (ArticleCell*)[self.articleCollectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    // [cell   prepareForReuse];             ******   Do I even need this?    *********
    [cell loadImages:[self.picArray objectAtIndex:indexPath.row]];
    /*[cell loadLabels: [NSString stringWithFormat:@"Article %ld", (long)indexPath.item]
                    : [NSString stringWithFormat:@"A brief, one line summary of the associated article."]
                    : [NSString stringWithFormat:@"Western Mustang"]];*/
    NSMutableArray *temp2 = [self.articleArray objectAtIndex:0];
    [cell loadLabels: [temp2 objectAtIndex:2]
                    : [temp2 objectAtIndex:3]
                    : [temp2 objectAtIndex:4]];
    
    return cell;
}

//size of each cell (width x height)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 190);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ArticlesDetailViewController *detVC = [[ArticlesDetailViewController alloc] init];
    [self.navigationController pushViewController:detVC animated:YES];
    NSMutableArray *temp3 = [self.articleArray objectAtIndex:1];
    [detVC loadData:[NSString stringWithFormat:@"%@", [temp3 objectAtIndex:2]]
                   :[NSString stringWithFormat:@"Western Mustang"]
                   :[NSString stringWithFormat:@"photo by xxxxx"]
                   :[NSString stringWithFormat:@" SO like something something fets cheese and gross stuff but like yeah and wine and chocolate but like also this and that and things and stuff. so like how could he!!!! couldn't freaking believe this. shouldn't I just not do this ever and stuff but liek typing is loud and annoying people is my FORTE @&&@ fbajfb ahihihihi justin timerlake. turtle remixes like trippy turtle. turtles have hard shells and shit. they get old and stuff, like I'm tlaking ancientttt. but not really ancient because that would be a lot older than what they actually live until. 'what do yo think?' 'I LIKE TURTLES!'"]
                   :[self.picArray objectAtIndex:indexPath.row]];
   // NSLog(@"%@", [self.articleArray objectAtIndex:indexPath.row]);
   /* [detVC loadData:[NSString stringWithFormat:@"Article %ld", (long)indexPath.item]
                   :[NSString stringWithFormat:@"Western Mustang"]
                   :[NSString stringWithFormat:@"photo by xxxxx"]
                   :[NSString stringWithFormat:@" SO like something something fets cheese and gross stuff but like yeah and wine and chocolate but like also this and that and things and stuff. so like how could he!!!! couldn't freaking believe this. shouldn't I just not do this ever and stuff but liek typing is loud and annoying people is my FORTE @&&@ fbajfb ahihihihi justin timerlake. turtle remixes like trippy turtle. turtles have hard shells and shit. they get old and stuff, like I'm tlaking ancientttt. but not really ancient because that would be a lot older than what they actually live until. 'what do yo think?' 'I LIKE TURTLES!'"]
                   :[self.picArray objectAtIndex:indexPath.row]];
*/
}

@end