//
//  AppDelegate.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/6/20.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@property(nonatomic,assign) bool loginOrNot;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]init];
    LoginViewController *lvc = [[LoginViewController alloc]init];
    self.window.rootViewController = lvc;
//    [[UINavigationController alloc]initWithRootViewController:lvc];
    lvc.navigationController.navigationBar.hidden =YES;  //隐藏导航条，避免与上部按钮发生冲突及造成遮挡
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    if(self.loginOrNot == NO){
        
    }
    
    return YES;
}

- (void)alreadyLogin{
    self.loginOrNot = YES;
//    self.window.rootViewController =
}




@end

