//
//  CustomNavBar.m
//  LazyTravels
//
//  Created by radar on 2018/9/1.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "CustomNavBar.h"

@interface CustomNavBar () {
    
   UINavigationController *_navController;
}

@property (nonatomic, strong) UIButton *navBackBtn;

@end



@implementation CustomNavBar
@dynamic navController;


- (id)init{
    self = [super init];
    if(self){
        //do something
        self = [[CustomNavBar alloc] initWithFrame:CGRectMake(0, 20, SCR_WIDTH, 44)];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.backgroundColor = COLOR_CLEAR;
        
        //add navBackBtn
        self.navBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _navBackBtn.frame = CGRectMake(10, 2, 40, 40);
        [_navBackBtn setBackgroundImage:IMAGE(@"IconNavback") forState:UIControlStateNormal];
        [_navBackBtn addTarget:self action:@selector(navBackAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_navBackBtn];
        
        
        
        
        
    }
    
    return self;
}

- (void)dealloc
{
}

- (void)setNavController:(UINavigationController *)navController
{
    _navController = navController;
    
    if(_navController)
    {
        _navController.delegate = self;
    }
}
- (UINavigationController *)navController
{
    return _navController;
}


- (void)navBackAction:(id)sender
{
    if(!self.navController) return;
    
    NSInteger vcount = self.navController.viewControllers.count;
    if(vcount > 1)
    {
        //还有可以退的层，继续退
        [_navController popViewControllerAnimated:YES];
    }
    else
    {
        //已经到了root，打开左菜单
        [_navController.topViewController performSelector:@selector(presentLeftMenuViewController:) withObject:nil];
    }
        
}


//UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger vcount = _navController.viewControllers.count;
    NSLog(@"vcount: %ld", vcount);
    
    if(vcount > 1)
    {
        //还有可以退的层，显示向左按钮
        //TO DO: 做按钮旋转
    }
    else
    {
        //已经到了root，显示向右按钮
        //TO DO: 做按钮旋转
    }
        
}





@end