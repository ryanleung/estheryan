//
//  ERWineCheesePairings.h
//  Estheryan
//
//  Created by Ryan Leung on 7/11/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 
 Singleton model class for wine cheese pairings.
 
 **/

@interface ERWineCheesePairings : NSObject

@property (nonatomic, strong) NSArray *wines;
@property (nonatomic, strong) NSArray *cheeses;
@property (nonatomic, strong) NSDictionary *wineToCheese;
@property (nonatomic, strong) NSDictionary *cheeseToWine;

+(ERWineCheesePairings *)singleton;


@end
