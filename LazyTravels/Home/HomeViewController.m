//
//  HomeViewController.m
//  LazyTravels
//
//  Created by radar on 2018/8/27.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "HomeViewController.h"
#import "TravelsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //self.title = @"首页";
    
    
    //设置一个按钮点击实现抽屉效果
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButton.frame = CGRectMake(0, 250, 150, 150);
    [leftButton addTarget:self action:@selector(leftButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"TRAVELS" forState:UIControlStateNormal];
    [self.view addSubview:leftButton];
    
    
}

-(void)leftButtonPressed
{
    TravelsViewController *travelsVC = [[TravelsViewController alloc] init];
    [self.navigationController pushViewController:travelsVC animated:YES];
    
}


@end
