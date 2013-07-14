//
//  ERAppDelegate.h
//  Estheryan
//
//  Created by Ryan Leung on 6/22/13.
//  Copyright (c) 2013 Estheryan. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 
 Features: http://inspirationfeed.com/inspiration/design-elements/40-quality-examples-of-ios-user-interface-designs/3/
 
 Look at BeachWeather app.
 
 Front/Landing page will be like that, where you can scroll through different options. When you click on an option, it will open up like a book!
 
 For the wine/cheese "book", you can click it and it will give you the two options, instead of splitting up into two books.
 
 Chat
 
 Blogs/Stories
 
 Photos
 
 Bets
 Current bet: debate on who's in best shape in September when wefirst see each other.
 whoever's in better shape/wins the debate wins. If ryan wins: korean meal. If esther wins: full course steak meal. 
 
 **/

@class ERViewController;

@interface ERAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ERViewController *viewController;

@end
