//
//  RootViewController.m
//  LazyTravels
//
//  Created by radar on 2018/8/27.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "RootViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    //将settingVC和mainVC添加到self中作为子控制器。将他们的view添加到self.view中
    [self addChildViewController:self.settingVC];
    [self.view addSubview:self.settingVC.view];
    [self addChildViewController:self.mainNav];
    [self.view addSubview:self.mainNav.view];
    
    //设置一个按钮点击实现抽屉效果
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButton.frame = CGRectMake(0, 50, 150, 150);
    [leftButton addTarget:self action:@selector(leftButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"LEFT" forState:UIControlStateNormal];
    [self.mainNav.view addSubview:leftButton];
}

-(void)leftButtonPressed
{    
    //判断抽屉是否是展开状态
    if (self.mainNav.view.frame.origin.x == 0) {
        
        //通过动画实现view.fram的改变
        [UIView animateWithDuration:0.25 animations:^{
            
            self.settingVC.view.frame = CGRectMake(0, 0, W, H);
            self.mainNav.view.frame = CGRectMake(W-80, 20, W, H-20*2);
            
        } completion:^(BOOL finished) {
        }];
        
    }else{
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.mainNav.view.frame = CGRectMake(0, 0, W, H);
            
        } completion:^(BOOL finished) {
        }];
    }
}

@end
