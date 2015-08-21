//
//  TCWalkthroughViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "TCWalkthroughViewController.h"
#import "NavigationManager.h"
#import "SystemStatics.h"


@interface TCWalkthroughViewController()<UIScrollViewDelegate>
@property (weak,nonatomic)  IBOutlet UIScrollView *scrollView;
@property (nonatomic,weak)id <UIScrollViewDelegate> delegate;
@property (weak,nonatomic) UIPageControl *pageControl;
@property (strong,nonatomic) UIView *readArticlesView;
@property (strong,nonatomic) UIView *watchVideosView;
@property (strong,nonatomic) UIView *findPopularSpotsView;
@property (strong,nonatomic) UIView *attendEventsView;
@property (strong,nonatomic) NSMutableArray *walkThroughViewsArray;

@end


@implementation TCWalkthroughViewController



//    UIScroll View and pageControl

-(void) setScrollView:(UIScrollView *)scrollView {
    _scrollView = scrollView ;
}
-(void) setPageControl:(UIPageControl *)pageControl{
    _pageControl = pageControl ;
}

//setters of four different subviews

-(UIView *) readArticlesView {
  
    CGSize size = [[UIScreen mainScreen]bounds].size;
    CGFloat frameX = size.width;
    CGFloat frameY = size.height;
    _readArticlesView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frameX, frameY)];
      _readArticlesView.backgroundColor = [UIColor whiteColor];
    UILabel *pageTitle = [[UILabel alloc]initWithFrame:CGRectMake(135,0,frameX/2,frameY/2)];
    [pageTitle setText:@"Read Articles"];
    [pageTitle setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
    [ _readArticlesView addSubview:pageTitle];
    return  _readArticlesView;
    }

-(UIView *)watchVideosView {
    
    CGSize size = [[UIScreen mainScreen]bounds].size;
    CGFloat frameX = size.width;
    CGFloat frameY = size.height;
    _watchVideosView = [[UIView alloc]initWithFrame:CGRectMake(frameX, 0, frameX*2, frameY*2)];
    _watchVideosView.backgroundColor = [UIColor whiteColor];
        UILabel *pageTitle = [[UILabel alloc]initWithFrame:CGRectMake(135,0,frameX/2,frameY/2)];
        [pageTitle setText:@"Watch Videos"];
        [ _watchVideosView addSubview:pageTitle];
        return  _watchVideosView;

}
-(UIView *)findPopularSpotsView{
    
        CGSize size = [[UIScreen mainScreen]bounds].size;
        CGFloat frameX = size.width;
        CGFloat frameY = size.height;
        _findPopularSpotsView = [[UIView alloc]initWithFrame:CGRectMake(frameX*2, 0, frameX, frameY)];
      _findPopularSpotsView.backgroundColor = [UIColor whiteColor];
        UILabel *pageTitle = [[UILabel alloc]initWithFrame:CGRectMake(135,0,frameX/2,frameY/2)];
        [pageTitle setText:@"Find Popular Sopts"];
        [ _findPopularSpotsView addSubview:pageTitle];
    return  _findPopularSpotsView;
    
}
-(UIView *)attendEventsView{
   
        CGSize size = [[UIScreen mainScreen]bounds].size;
        CGFloat frameX = size.width;
        CGFloat frameY = size.height;
        _attendEventsView = [[UIView alloc]initWithFrame:CGRectMake(frameX*3, 0, frameX, frameY)];
       _attendEventsView.backgroundColor = [UIColor lightTextColor];
        UILabel *pageTitle = [[UILabel alloc]initWithFrame:CGRectMake(135,0,frameX/2,frameY/2)];
        [pageTitle setText:@"Attend Events"];
        [ _attendEventsView addSubview:pageTitle];
// will crash, not sure why
//     UIButton* btnGoHome = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frameX, frameY)];
//    [btnGoHome setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnGoHome setTitle:@"Finish" forState:UIControlStateNormal];
//    [btnGoHome addTarget:self action:@selector(goToAppContent) forControlEvents:UIControlEventTouchUpInside];
//     [_attendEventsView addSubview:btnGoHome];
        return  _attendEventsView;

    
}
#define WALK_THROUGH_PICTURE_NUM 5


- (void)viewDidLoad {
    
    [super viewDidLoad];
    CGSize size = [[UIScreen mainScreen]bounds].size;
    CGFloat frameX = size.width;
    CGFloat frameY = size.height;
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frameX, frameY)];
    scrollView.contentSize = CGSizeMake(frameX*4,frameY*4);
    [self setScrollView:scrollView];
    [self.view addSubview:self.scrollView];
    NSMutableArray  *viewsArray = [[NSMutableArray alloc]init];
    [viewsArray insertObject:self.readArticlesView atIndex:0];
    [viewsArray insertObject:self.watchVideosView atIndex:1];
    [viewsArray insertObject:self.findPopularSpotsView atIndex:2];
    [viewsArray insertObject:self.attendEventsView  atIndex:3];
//    adding views to the scrollView
     self.scrollView.contentSize = CGSizeMake(frameX*[viewsArray count], frameY);
    for ( int i = 0 ; i < [viewsArray count] ; i++)
    {
    [self.scrollView addSubview:[viewsArray objectAtIndex:i]];
    }
    self.scrollView.pagingEnabled = YES;
    UIPageControl  *pageControl = [[UIPageControl alloc]init];
    [self setPageControl:pageControl];
    self.pageControl.frame = CGRectMake(100, frameY -100,frameX -200,100);
    self.pageControl.numberOfPages = 4;
    [self.pageControl setTintColor:[UIColor blackColor]];
    [self.view addSubview:pageControl];
    self.scrollView.delegate = self ;

    
}


 -(void) scrollViewDidScroll:(UIScrollView *)scrollView; {
  CGFloat pageWidth = self.scrollView.frame.size.width ;
  int page = floor((self.scrollView.contentOffset.x -pageWidth / 2 ) / pageWidth) + 1;
     self.pageControl.currentPage = page;
     
}
    - (void) goToAppContent {
    
    [[NavigationManager singletonInstance] goToMainSection];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:kUserHasOnboarded];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
