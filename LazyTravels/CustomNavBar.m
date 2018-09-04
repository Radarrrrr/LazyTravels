//
//  CustomNavBar.m
//  LazyTravels
//
//  Created by radar on 2018/9/1.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "CustomNavBar.h"


typedef enum {
    directionLeft = 0,    //返回按钮方向向左
    directionRight        //返回按钮方向向右
} NavBtnDirection;



@interface CustomNavBar () {
    
    UINavigationController *_navController;
}

@property (nonatomic, weak)   UINavigationController *navController; //主导航控制器

@property (nonatomic, strong) UIButton *navBackBtn;         //主导航返回按钮
@property (nonatomic)         NavBtnDirection curDirection; //当前按钮朝向

@property (nonatomic, strong) UILabel *titleLabel; //标题label

@end



@implementation CustomNavBar
@dynamic navController;


+ (instancetype)sharedNavBar
{
    static dispatch_once_t onceToken;
    static CustomNavBar *navBar;
    dispatch_once(&onceToken, ^{
        navBar = [[CustomNavBar alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, 60, 44)];
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
        
        
        //add titlelabel
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 8, SCR_WIDTH-60-40, 28)]; 
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.alpha = 0.6;
        _titleLabel.userInteractionEnabled = NO;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = COLOR_TEXT_A;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self addSubview:_titleLabel];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(-4, CGRectGetHeight(_titleLabel.frame)-1.0, CGRectGetWidth(_titleLabel.frame)+4, 1.0)];
        line.backgroundColor = RGBS(150);
        [_titleLabel addSubview:line];
        
        
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
    //显示或者隐藏title
    _titleLabel.text = viewController.title;
    if(self.titleLabel.text)
    {
        self.titleLabel.alpha = 0.6;
    }
    else
    {
        self.titleLabel.alpha = 0.0;
    }

    //调整返回按钮状态
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



@end
