//
//ERWineCheesePairings.m
//Estheryan
//
//CreatedbyRyanLeungon7/11/13.
//Copyright(c)2013Estheryan.Allrightsreserved.
//

#import"ERWineCheesePairings.h"

@implementation ERWineCheesePairings

/**
 
 Source from http://wine.about.com/od/servingwines/a/wineandcheese.htm
 
 **/

#pragma mark - Singleton enforcement
static ERWineCheesePairings *singleton = nil;

-(id)init
{
    if (singleton != nil)
    {
        [NSException raise:NSInternalInconsistencyException
            format:@"Cannot initialize a singleton directly, must use [ERWineCheesePairingssingleton]"];
}
    else if ( self = [super init] )
    {
        self.wines = @[@"Beaujolais",@"Cabernet Franc",@"Cabernet Sauvignon",@"Chardonnay",@"Champagne",@"Chenin Blanc",@"Chianti",@"Dessert Wine",@"Gewurztraminer",@"Gruner Veltliner",@"Merlot",@"Pinot Blanc",@"Pinot Gris",@"Pinot Noir",@"Port",@"Riesling",@"Rioja",@"Sangiovese",@"Sauvignon Blanc",@"Shiraz/Syrah",@"Zinfandel"];
        self.cheeses = @[@"Blue",@"Brie",@"Camembert",@"Cheddar",@"Fontina",@"goatcheese",@"Gorgonzola",@"Port Salut",@"Swiss",@"Gouda",@"Gruyere",@"Provolone",@"Beaufort",@"Chevre",@"Colby",@"Edam",@"Parmesan",@"Graddost",@"Mozarella",@"Creme Fraiche",@"Marscopone",@"Boursin",@"Muenster",@"Wensleydale",@"Munster(the original French version)",@"Jarlsberg",@"Feta",@"aged Cheddar",@"Asiago",@"Ricotta",@"Monterey Jack",@"Havarti",@"Neufchatel"];
        self.wineToCheese = @{@"Beaujolais": @[@"Brie", @"Camembert", @"goat cheese"], @"Merlot": @[@"Brie", @"Camembert", @"Cheddar", @"Gorgonzola", @"Gouda", @"Gruyere", @"Jarlsberg", @"Parmesan"], @"Dessert Wine": @[@"Creme Fraiche", @"Marscopone"], @"Cabernet Franc": @[@"Blue", @"Brie", @"Camembert", @"Cheddar", @"Fontina", @"goat cheese", @"Gorgonzola", @"Port Salut", @"Swiss"], @"Pinot Noir": @[@"Brie", @"Camembert", @"Feta", @"Gruyere", @"Monterey Jack", @"Muenster", @"Port Salut", @"Swiss"], @"Shiraz/Syrah": @[@"Cheddar", @"Edam", @"Gouda", @"Parmesan"], @"Rioja": @[@"Asiago", @"Cheddar", @"Havarti"], @"Pinot Blanc": @[@"Brie", @"Camembert", @"Feta"], @"Chardonnay": @[@"Brie", @"Camembert", @"goat cheese", @"Gouda", @"Gruyere", @"Parmesan", @"Provolone"], @"Sangiovese": @[@"Blue", @"Fontina", @"Mozzarella", @"Parmesan", @"Provolone", @"Ricotta"], @"Gruner Veltliner": @[@"Blue cheese", @"goat cheese", @"Munster (the original French version)"], @"Sauvignon Blanc": @[@"Asiago", @"Brie", @"Cheddar", @"Feta", @"goat cheese", @"Gruyere", @"Neufchatel", @"Parmesan"], @"Cabernet Sauvignon": @[@"Camembert", @"Cheddar", @"Colby", @"Danish Blue", @"Gorgonzola", @"Gouda", @"Parmesan", @"Blue cheese", @"Roquefort"], @"Pinot Gris": @[@"aged Cheddar", @"Asiago", @"Edam", @"goat cheese", @"Gouda", @"Mozarella", @"Muenster", @"Ricotta"], @"Chenin Blanc": @[@"Camembert", @"goat cheese", @"Graddost"], @"Zinfandel": @[@"Asiago", @"Blue", @"Feta", @"goat cheese", @"Gouda", @"Gruyere", @"Muenster"], @"Riesling": @[@"Brie", @"Blue", @"Colby", @"Edam", @"Gouda", @"Monterey Jack"], @"Port": @[@"Blue", @"Gorgonzola"], @"Champagne": @[@"Beaufort", @"Brie", @"Camembert", @"Cheddar", @"Chevre", @"Colby", @"Edam", @"Gouda", @"Gruyere", @"Parmesan"], @"Chianti": @[@"Fontina", @"Mozarella", @"Parmesan", @"Provolone"], @"Gewurztraminer": @[@"Boursin", @"Camembert", @"Chevre", @"Muenster", @"Swiss", @"Wensleydale"]};
        self.cheeseToWine = @{@"Provolone": @[@"Chardonnay", @"Chianti", @"Sangiovese"], @"Mozarella": @[@"Chianti", @"Pinot Gris"], @"Blue": @[@"Cabernet Franc", @"Cabernet Sauvignon", @"Gruner Veltliner", @"Port", @"Riesling", @"Sangiovese", @"Zinfandel"], @"Neufchatel": @[@"Sauvignon Blanc"], @"Camembert": @[@"Beaujolais", @"Cabernet Franc", @"Cabernet Sauvignon", @"Chardonnay", @"Champagne", @"Chenin Blanc", @"Gewurztraminer", @"Merlot", @"Pinot Blanc", @"Pinot Noir"], @"Edam": @[@"Champagne", @"Pinot Gris", @"Riesling", @"Shiraz/Syrah"], @"Chevre": @[@"Champagne", @"Gewurztraminer"], @"aged Cheddar": @[@"Pinot Gris"], @"Asiago": @[@"Pinot Gris", @"Rioja", @"Sauvignon Blanc", @"Zinfandel"], @"Havarti": @[@"Rioja"], @"Monterey Jack": @[@"Pinot Noir", @"Riesling"], @"Wensleydale": @[@"Gewurztraminer"], @"goatcheese": @[@"Beaujolais", @"Cabernet Franc", @"Chardonnay", @" Chenin Blanc", @"Gruner Veltliner", @"Pinot Gris", @"Sauvignon Blanc", @"Zinfandel"], @"Ricotta": @[@"Pinot Gris", @"Sangiovese"], @"Graddost": @[@"Chenin Blanc"], @"Port Salut": @[@"Cabernet Franc", @"Pinot Noir"], @"Gouda": @[@"Cabernet Sauvignon", @"Chardonnay", @"Champagne", @"Merlot", @"Pinot Gris", @"Riesling", @"Shiraz/Syrah", @"Zinfandel"], @"Colby": @[@"Cabernet Sauvignon", @"Champagne", @"Riesling"], @"Munster(the original French version)": @[@"Gruner Veltliner"], @"Brie": @[@"Beaujolais", @"Cabernet Franc", @"Chardonnay", @"Champagne", @"Merlot", @"Pinot Blanc", @"Pinot Noir", @"Riesling", @"Sauvignon Blanc"], @"Cheddar": @[@"Cabernet Franc", @"Cabernet Sauvignon", @"Champagne", @"Merlot", @"Pinot Gris", @"Rioja", @"Sauvignon Blanc", @"Shiraz/Syrah"], @"Feta": @[@"Pinot Blanc", @"Pinot Noir", @"Sauvignon Blanc", @"Zinfandel"], @"Gorgonzola": @[@"Cabernet Franc", @"Cabernet Sauvignon", @"Merlot", @"Port"], @"Parmesan": @[@"Cabernet Sauvignon", @"Chardonnay", @"Champagne", @"Chianti", @"Merlot", @"Sangiovese", @"Sauvignon Blanc", @"Shiraz/Syrah"], @"Fontina": @[@"Cabernet Franc", @"Chianti", @"Sangiovese"], @"Creme Fraiche": @[@"Dessert Wine"], @"Marscopone": @[@"Dessert Wine"], @"Swiss": @[@"Cabernet Franc", @"Gewurztraminer", @"Pinot Noir"], @"Boursin": @[@"Gewurztraminer"], @"Beaufort": @[@"Champagne"], @"Jarlsberg": @[@"Merlot"], @"Muenster": @[@"Gewurztraminer", @"Pinot Gris", @"Pinot Noir", @"Zinfandel"], @"Gruyere": @[@"Chardonnay", @"Champagne", @"Merlot", @"Pinot Noir", @"Sauvignon Blanc", @"Zinfandel"]};
        
	}
	return self;
}

+(ERWineCheesePairings *)singleton {
	@synchronized(self) {
		if(singleton == nil) {
			singleton = [[self alloc] init]; //sets the sharedManager automatically
		}
	}
	return singleton;
}

@end
