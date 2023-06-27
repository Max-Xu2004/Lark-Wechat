//
//  AppDelegate.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/6/20.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic,strong)UIWindow *window;

+ (void)setRootViewViewController:(UIViewController *)controller;

+ (void)alreadyLogin;

@end

