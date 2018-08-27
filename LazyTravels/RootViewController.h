//
//  RootViewController.h
//  LazyTravels
//
//  Created by radar on 2018/8/27.
//  Copyright © 2018年 radar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

//两个子控制器settingVC和mainVC
@property(nonatomic, weak) UIViewController *settingVC;
@property(nonatomic, weak) UINavigationController *mainNav;

@end

