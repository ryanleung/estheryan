//
//  ERWineViewController.m
//  Estheryan
//
//  Created by Ryan Leung on 6/23/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import "ERWineViewController.h"
#import "ERWineCheesePairings.h"
#import "ERWineToCheeseViewController.h"

@interface ERWineViewController ()

@end

@implementation ERWineViewController

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
    self.table.delegate = self;
    self.table.dataSource = self;
    
    
    self.listOfWines = [[[ERWineCheesePairings singleton] wines] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
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
    return self.listOfWines.count;
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
    cell.textLabel.text = [self.listOfWines objectAtIndex:section];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int currentSection = indexPath.section;
    NSString *currentWine = self.listOfWines[currentSection];
    ERWineToCheeseViewController *wineToCheeseVC = [[ERWineToCheeseViewController alloc] init];
    wineToCheeseVC.cheeses = [[[ERWineCheesePairings singleton] wineToCheese] objectForKey:currentWine];
    [self.navigationController pushViewController:wineToCheeseVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



@end
