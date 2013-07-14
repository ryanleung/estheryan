//
//  ERCheeseToWineViewController.h
//  Estheryan
//
//  Created by Ryan Leung on 7/11/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERCheeseToWineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *wines;

@end
