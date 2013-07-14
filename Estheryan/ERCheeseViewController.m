//
//  ERCheeseViewController.m
//  Estheryan
//
//  Created by Ryan Leung on 6/23/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import "ERCheeseViewController.h"
#import "ERCheeseToWineViewController.h"
#import "ERWineCheesePairings.h"

@interface ERCheeseViewController ()

@end

@implementation ERCheeseViewController

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
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    self.cheeses = [[[ERWineCheesePairings singleton] cheeses] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    // source: http://wine.about.com/od/servingwines/a/wineandcheese.htm
    /**
     Good cheeses that went with the wine.
     
     Red:
     White:
     Rose:
     **/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table View Delegate/Datasource Methods
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cheeses.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//Number of rows it should expect should be based on the section
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    NSString *tableNumber = [NSString stringWithFormat:@"Table %d", section + 1];
//    return tableNumber;
//}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MessageCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    int section = indexPath.section;
    cell.textLabel.text = [self.cheeses objectAtIndex:section];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int currentSection = indexPath.section;
    NSString *currentCheese = self.cheeses[currentSection];
    ERCheeseToWineViewController *cheeseToWineVC = [[ERCheeseToWineViewController alloc] init];
    cheeseToWineVC.wines = [[[ERWineCheesePairings singleton] cheeseToWine] objectForKey:currentCheese];
    [self.navigationController pushViewController:cheeseToWineVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
