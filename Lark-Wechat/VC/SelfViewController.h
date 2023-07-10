//
//  SelfViewController.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/9.
//

#import <UIKit/UIKit.h>
// 系统相机
#import <AVFoundation/AVFoundation.h>
// 系统相册
#import <AssetsLibrary/AssetsLibrary.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelfViewController : UIViewController<
UITableViewDelegate,
UITableViewDataSource,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

@end

NS_ASSUME_NONNULL_END
