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

@interface TCWalkthroughViewController ()
@property (strong
        , nonatomic) IBOutlet UILabel *PageNumber;
@property (assign,nonatomic) NSInteger index;

@end

@implementation TCWalkthroughViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
#warning testingWalkThrough
    
    self.walkThroughPageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.walkThroughPageController.dataSource = self;
    [[self.walkThroughPageController view] setFrame:[[self view] bounds]];
    
    TCWalkthroughViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.walkThroughPageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.walkThroughPageController];
    [[self view] addSubview:[self.walkThroughPageController view]];
    [self.walkThroughPageController didMoveToParentViewController:self];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIButton* btnGoHome = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
//    [btnGoHome setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnGoHome setTitle:@"Finish" forState:UIControlStateNormal];
//    [btnGoHome addTarget:self action:@selector(goToAppContent) forControlEvents:UIControlEventTouchUpInside];
//    btnGoHome.center = self.view.center;
//    [self.view addSubview:btnGoHome];
    
    self.PageNumber.text = [NSString stringWithFormat:@"Page #%ld",(long)self.index];
}
- (void) goToAppContent {
    
    [[NavigationManager singletonInstance] goToMainSection];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:kUserHasOnboarded];
    
}

# warning testing Walkthrough using stroyBoard

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TCWalkthroughViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TCWalkthroughViewController *)viewController index];
    
    
    index++;
    
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (TCWalkthroughViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"WalkThrough" bundle:nil];
    TCWalkthroughViewController *childViewController = [storyBoard instantiateViewControllerWithIdentifier:@"WalkThrough"];
    return childViewController;
    
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
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
