//
//  ERViewController.m
//  Estheryan
//
//  Created by Ryan Leung on 6/22/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import "ERViewController.h"
#import "ERWineCheesePageViewController.h"


@interface ERViewController ()

@end

@implementation ERViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // adding page view controller
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageVC.dataSource = self;
    [self.pageVC.view setFrame:self.view.bounds];
    self.pageVC.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wooden-background.png"]];
    ERWineCheesePageViewController *wineCheesePageVC = [[ERWineCheesePageViewController alloc] init];
    self.pageViewControllers = [NSArray arrayWithObject:wineCheesePageVC];
    [self.pageVC setViewControllers:self.pageViewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark UIPageViewController Data Source methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    int indexOfCurrentVC = [self.pageViewControllers indexOfObject:viewController];
    if ( indexOfCurrentVC == 0 )
        return nil;
    else
        return self.pageViewControllers[indexOfCurrentVC + 1];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    int indexOfCurrentVC = [self.pageViewControllers indexOfObject:viewController];
    if ( indexOfCurrentVC == self.pageViewControllers.count - 1 )
        return nil;
    else
        return self.pageViewControllers[indexOfCurrentVC - 1];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return self.pageViewControllers.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

@end
