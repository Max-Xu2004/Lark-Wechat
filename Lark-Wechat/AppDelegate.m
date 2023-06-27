//
//  AppDelegate.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/6/20.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "FriendViewController.h"
#import "friendCircleViewController.h"

@interface AppDelegate ()

@property(nonatomic,assign) bool loginOrNot;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]init];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    if(self.loginOrNot == NO){
        LoginViewController *lvc = [[LoginViewController alloc]init];
        [AppDelegate setRootViewViewController:lvc];
    }
    return YES;
}

+ (void)setRootViewViewController:(UIViewController *)controller{
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    //清空root
    if (window.rootViewController){
        window.rootViewController = nil;
    }
    window.rootViewController = controller;
}

+ (void)alreadyLogin{
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.title = @"首页";
    mainVC.tabBarItem.title = @"首页";
    mainVC.tabBarItem.image = [UIImage imageNamed:@"message"];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainNav.navigationBar.translucent = YES;
    
    FriendViewController *friendVC = [[FriendViewController alloc] init];
    friendVC.title = @"通讯录";
    friendVC.tabBarItem.title = @"通讯录";
    friendVC.tabBarItem.image = [UIImage imageNamed:@"friend"];
    UINavigationController *friendNav = [[UINavigationController alloc] initWithRootViewController:friendVC];
    friendNav.navigationBar.translucent = YES;
    
    FriendCircleViewController *fcVC = [[FriendCircleViewController alloc]init];
    fcVC.title = @"发现";
    fcVC.tabBarItem.title = @"发现";
    fcVC.tabBarItem.image = [UIImage imageNamed:@"friendcircle"];
    UINavigationController *fcNav = [[UINavigationController alloc] initWithRootViewController:fcVC];
    fcNav.navigationBar.translucent = YES;
    
    NSArray *vcsArray = [NSArray arrayWithObjects:mainNav,friendNav,fcNav, nil];
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    [[UITabBar appearance] setBackgroundColor:UIColor.whiteColor];
    tabBarVC.viewControllers = vcsArray;
    for (UITabBarItem *item in tabBarVC.tabBar.items) {

    item.imageInsets = UIEdgeInsetsMake(2, 2, 2,2);

    }
    
    //清空root
    if (window.rootViewController){
        window.rootViewController = nil;
    }
    window.rootViewController = tabBarVC;
    
}




@end

