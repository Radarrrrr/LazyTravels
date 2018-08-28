//
//  AppDelegate.h
//  LazyTravels
//
//  Created by radar on 2018/8/27.
//  Copyright © 2018年 radar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "HomeViewController.h"
#import "MenuViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, RESideMenuDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) RESideMenu *rootViewController;

@property (nonatomic, strong) HomeViewController *homeVC;
@property (nonatomic, strong) UINavigationController *mainNav;
@property (nonatomic, strong) MenuViewController *menuVC;

@end

