//
//  FriendViewController.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/6/26.
//

#import <UIKit/UIKit.h>

#define STATUSBARHEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface FriendViewController : UIViewController

@property (nonatomic,strong) UIButton *add; //添加好友的按钮

@end

NS_ASSUME_NONNULL_END
