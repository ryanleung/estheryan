//
//  ERViewController.h
//  Estheryan
//
//  Created by Ryan Leung on 6/22/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSArray *pageViewControllers;


@end
