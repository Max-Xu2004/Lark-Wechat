//
//  FriendDetailViewController.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/9.
//

#import <UIKit/UIKit.h>
#import "FriendModel.h"

#define STATUSBARHEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface FriendDetailViewController : UIViewController

@property (nonatomic,strong) FriendModel *detailModel;


@end

NS_ASSUME_NONNULL_END
