//
//  CustomNavBar.h
//  LazyTravels
//
//  Created by radar on 2018/9/1.
//  Copyright © 2018年 radar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavBar : UIView <UINavigationControllerDelegate>

+ (instancetype)sharedNavBar;

//@property (nonatomic) BOOL navBarHidden;    //是否隐藏 default YES

- (void)addNavBarOnMainNav:(UINavigationController*)mainNav; //添加本导航条到主导航控制器上，本方法只能调用一次





@end
