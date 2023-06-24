//
//  LoginViewController.h
//  Lark+Wechat
//
//  Created by 许晋嘉 on 2023/6/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginAndCreateMainView <NSObject>

-(void)alreadyLogin;

@end

@interface LoginViewController : UIViewController

-(void)presentAlertControllerwithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
