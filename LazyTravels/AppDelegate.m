//
//  AppDelegate.m
//  LazyTravels
//
//  Created by radar on 2018/8/27.
//  Copyright © 2018年 radar. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomNavBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //主导航
    self.homeVC = [[HomeViewController alloc] init];
    self.mainNav = [[UINavigationController alloc] initWithRootViewController:_homeVC];
    //_mainNav.navigationBarHidden = YES; //用这个会影响右滑关闭手势，用下面那个
    _mainNav.navigationBar.hidden=YES;
    _mainNav.navigationBar.translucent = NO; //不要导航条模糊，为了让页面从导航条下部是0开始，如果为YES，则从屏幕顶部开始是0
    
    //添加自定义导航栏
    [[CustomNavBar sharedNavBar] addNavBarOnMainNav:_mainNav];
    
    //左侧菜单页
    self.menuVC = [[MenuViewController alloc] init];

    //主框架
    self.rootViewController = [[RESideMenu alloc] initWithContentViewController:_mainNav leftMenuViewController:_menuVC rightMenuViewController:nil];
    _rootViewController.backgroundImage = [self menuBackImageWithTimeSlot];
    _rootViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    _rootViewController.delegate = self;
    _rootViewController.contentViewShadowColor = [UIColor blackColor];
    _rootViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    _rootViewController.contentViewShadowOpacity = 0.6;
    _rootViewController.contentViewShadowRadius = 12;
    _rootViewController.contentViewShadowEnabled = YES;
    _rootViewController.parallaxEnabled = NO;
    _rootViewController.animationDuration = 0.25;
    
    
    self.window.rootViewController = _rootViewController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




#pragma mark - RESideMenu Delegate
- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
    
    UIView *contentView = menuViewController.sideMenuViewController.contentViewController.view;
    [RDFunction addRadiusToView:contentView radius:12];
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
    
    UIView *contentView = menuViewController.sideMenuViewController.contentViewController.view;
    [RDFunction addRadiusToView:contentView radius:0];
}



#pragma mark - 一些配套方法
- (UIImage *)menuBackImageWithTimeSlot
{
    //根据每天时间段返回menu的背景图片
    NSString *imgName = @"night";
    
    NSInteger now = [[RDFunction stringFromDate:[NSDate date] useFormat:@"HH"] integerValue];
    NSLog(@"now time: %ld", now);
    
    if(now >= 6 && now < 9) //早上
    {
        imgName = @"morning";
    }
    else if(now >= 9 && now < 12) //上午
    {
        imgName = @"forenoon";
    }
    else if(now >= 12 && now < 14) //中午
    {
        imgName = @"noon";
    }
    else if(now >= 14 && now < 17) //下午
    {
        imgName = @"afternoon";
    }
    else if(now >= 17 && now < 20) //傍晚
    {
        imgName = @"dusk";
    }
    else                           //夜晚
    {
        imgName = @"night";
    }
  
    UIImage *backImg = [UIImage imageNamed:imgName];
    return backImg;
}




@end
