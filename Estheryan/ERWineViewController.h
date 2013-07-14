//
//  ERWineViewController.h
//  Estheryan
//
//  Created by Ryan Leung on 6/23/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERWineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *table;
@property (nonatomic, strong) NSArray *listOfWines;
@end
