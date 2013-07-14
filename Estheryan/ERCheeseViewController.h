//
//  ERCheeseViewController.h
//  Estheryan
//
//  Created by Ryan Leung on 6/23/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERCheeseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *cheeses;

@end
