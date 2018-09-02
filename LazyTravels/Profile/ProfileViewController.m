//
//  ProfileViewController.m
//  LazyTravels
//
//  Created by radar on 2018/9/2.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = COLOR_ORANGE;
    
    //设置一个按钮点击实现抽屉效果
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButton.frame = CGRectMake(0, 250, 150, 150);
    [leftButton addTarget:self action:@selector(leftButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"MENU" forState:UIControlStateNormal];
    [self.view addSubview:leftButton];
    
    
}

-(void)leftButtonPressed
{
    [DDCenter actionForLinkURL:@"menu://"];
    
}


@end
