//
//  CustomNavBar.m
//  LazyTravels
//
//  Created by radar on 2018/9/1.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "CustomNavBar.h"


#define NAV_FRAME_SHOW  CGRectMake(0, 0, SCR_WIDTH, NAV_BAR_HEIGHT) //导航条显示时候的尺寸
#define NAV_FRAME_HIDE  CGRectMake(0, 0, 60, NAV_BAR_HEIGHT)        //导航条隐藏时候的尺寸


typedef enum {
    directionLeft = 0,    //返回按钮方向向左
    directionRight        //返回按钮方向向右
} NavBtnDirection;



@interface CustomNavBar () {
    
    UINavigationController *_navController;
    //BOOL _navBarHidden;
    
}

@property (nonatomic, weak)   UINavigationController *navController; //主导航控制器

//@property (nonatomic, strong) UIImageView *tintView;        //导航条背景，用于修改颜色、透明度、贴图等
@property (nonatomic, strong) UIButton *navBackBtn;         //主导航返回按钮
@property (nonatomic)         NavBtnDirection curDirection; //当前按钮朝向

@end



@implementation CustomNavBar
@dynamic navController;
//@dynamic navBarHidden;


+ (instancetype)sharedNavBar
{
    static dispatch_once_t onceToken;
    static CustomNavBar *navBar;
    dispatch_once(&onceToken, ^{
        navBar = [[CustomNavBar alloc] initWithFrame:NAV_FRAME_HIDE];
    });
    return navBar;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.backgroundColor = [UIColor clearColor];
        self.curDirection = directionRight;
        
        //_navBarHidden = YES;
        
        //add tintView
//        self.tintView = [[UIImageView alloc] initWithFrame:NAV_FRAME_SHOW];
//        _tintView.backgroundColor = [UIColor whiteColor];
//        _tintView.alpha = 0.5;
//        [self addSubview:_tintView];
        
        
        //add navBackBtn
        self.navBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _navBackBtn.frame = CGRectMake(10, STATUS_BAR_HEIGHT+2, 40, 40);
        [_navBackBtn setBackgroundImage:IMAGE(@"IconNavback") forState:UIControlStateNormal];
        [_navBackBtn addTarget:self action:@selector(navBackAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_navBackBtn];
        
        
        
    }
    
    return self;
}

- (void)dealloc
{
}




#pragma mark - setter & getter
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

//- (void)setNavBarHidden:(BOOL)navBarHidden
//{
//    _navBarHidden = navBarHidden;
//}
//- (BOOL)navBarHidden
//{
//    return _navBarHidden;
//}



#pragma mark - 类方法，供外部使用
- (void)addNavBarOnMainNav:(UINavigationController*)mainNav
{
    if(!mainNav || ![mainNav isKindOfClass:[UINavigationController class]]) return;
    
    self.navController = mainNav;
    [mainNav.view addSubview:self];
}



#pragma mark - 内部方法
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
        [DDCenter actionForLinkURL:@"menu://"];
    }
}

//UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger vcount = _navController.viewControllers.count;
    //NSLog(@"vcount: %ld", vcount);
    
    if(vcount > 1)
    {
        //还有可以退的层，显示向左按钮
        [self rotateNavBtnToDirection:directionLeft];
    }
    else
    {
        //已经到了root，显示向右按钮
        [self rotateNavBtnToDirection:directionRight];
    }
        
}

- (void)rotateNavBtnToDirection:(NavBtnDirection)direction
{  
    if(_curDirection == direction) return;
    
    [LTFunction rotateView:_navBackBtn angle:M_PI duration:0.25 completion:^{
        
        self.curDirection = direction;
    }];
}  

//- (void)showNavBar:(BOOL)bshow
//{
//    
//}


@end
