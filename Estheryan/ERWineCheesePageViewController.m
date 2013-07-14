//
//  ERWineCheesePageViewController.m
//  Estheryan
//
//  Created by Ryan Leung on 7/13/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import "ERWineCheesePageViewController.h"
#import "ERWineViewController.h"
#import "ERCheeseViewController.h"

@interface ERWineCheesePageViewController ()
@property BOOL wineSelected;
@property (nonatomic, strong) UIButton *pageView;
@property (nonatomic, strong) UIButton *toggleButton;
@end

@implementation ERWineCheesePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];
    
    // page background
    self.pageView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pageView.frame = CGRectMake(pageX, pageY, pageWidth, pageHeight);
    [self.pageView setImage:[UIImage imageNamed:@"wineSelectedPage.png"] forState:UIControlStateNormal];
    [self.pageView addTarget:self action:@selector(pageViewClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pageView];
    self.wineSelected = YES;
    
    
    
    // setup button
    self.toggleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.toggleButton.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
    [self.toggleButton setImage:[UIImage imageNamed:@"switchWCselected.png"] forState:UIControlStateSelected];
    [self.toggleButton addTarget:self action:@selector(toggleWineCheese) forControlEvents:UIControlEventTouchUpInside];
    [self.toggleButton setImage:[UIImage imageNamed:@"switchWCunselected.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.toggleButton];

}

-(void)toggleWineCheese
{
    if (self.wineSelected)
    {
        //hackish, will fix. Fixing problem of moving screen
        self.pageView.frame = CGRectMake(pageX - 1.5, pageY - .75, pageWidth, pageHeight);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.7];
        [self.pageView setAlpha:0.0];
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [self.pageView setAlpha:1.0];
        [self.pageView setImage:[UIImage imageNamed:@"cheeseSelectedPage.png"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else
    {
        //hackish, will fix. Fixing problem of moving screen
        self.pageView.frame = CGRectMake(pageX, pageY, pageWidth, pageHeight);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.7];
        [self.pageView setAlpha:0.0];
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [self.pageView setAlpha:1.0];
        [self.pageView setImage:[UIImage imageNamed:@"wineSelectedPage.png"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
        self.wineSelected = !self.wineSelected;
}

-(void)pageViewClicked
{
    if (self.wineSelected)
    {
        ERWineViewController *wineVC = [[ERWineViewController alloc] init];
        [self.navigationController pushViewController:wineVC animated:YES];
    }
    else
    {
        ERCheeseViewController *cheeseVC = [[ERCheeseViewController alloc] init];
        [self.navigationController pushViewController:cheeseVC animated:YES];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
