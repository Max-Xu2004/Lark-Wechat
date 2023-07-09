//
//  MessageTableViewCell.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/6.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface MessageTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *personLab;
@property (nonatomic,strong) UILabel *tLab;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UIImageView *bellImgView;
@property (nonatomic,strong) UILabel *dateLab;

@end

NS_ASSUME_NONNULL_END
