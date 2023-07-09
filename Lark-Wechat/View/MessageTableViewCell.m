//
//  MessageTableViewCell.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/6.
//

#import "MessageTableViewCell.h"

@interface MessageTableViewCell ()

//@property (nonatomic,strong) UIView *separator;

@end


@implementation MessageTableViewCell

-(instancetype)init {
    self = [super init];
    if(self){
        [self.contentView addSubview:self.personLab];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.tLab];
        [self.contentView addSubview:self.dateLab];
        [self.contentView addSubview:self.bellImgView];
    }
    return self;
}

#pragma mark -懒加载
- (UILabel *)personLab{
    if(_personLab == nil){
        _personLab = [[UILabel alloc] initWithFrame:CGRectMake(self.imageView.frame.origin.x+self.imgView.frame.size.width+30, self.imgView.frame.origin.y, SCREEN_WIDTH-(self.imgView.frame.origin.x+self.imgView.frame.size.width+15)-40, 30)];
        _personLab.font = [UIFont systemFontOfSize:22];
        _personLab.textColor = UIColor.blackColor;
        _personLab.textAlignment = NSTextAlignmentLeft;
        
    }
    return _personLab;
}

- (UILabel *)tLab{
    if(_tLab == nil){
        _tLab = [[UILabel alloc] initWithFrame:CGRectMake(self.personLab.frame.origin.x, self.personLab.frame.origin.y+self.personLab.frame.size.height, self.personLab.frame.size.width, 25)];
        _tLab.font = [UIFont systemFontOfSize:17];
        _tLab.textColor = UIColor.grayColor;
        _tLab.textAlignment = NSTextAlignmentLeft;
    }
    return _tLab;
}

- (UIImageView *)imgView{
    if(_imgView == nil){
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 5;
    }
    return _imgView;
}

- (UILabel *)dateLab{
    if(_dateLab == nil){
        _dateLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, self.personLab.frame.origin.y+5, 50, 20)];
        _dateLab.font = [UIFont systemFontOfSize:15];
        _dateLab.textColor = UIColor.grayColor;
        _dateLab.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLab;
}

- (UIImageView *)bellImgView{
    if(_bellImgView == nil){
        _bellImgView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, self.contentView.frame.size.height+7, 20, 20)];
        
    }
    return _bellImgView;
}

//- (UIView *)separator{
//    if(_separator == nil){
//        _separator = [[UIView alloc] initWithFrame:CGRectMake(self.personLab.frame.origin.x, 85-1, SCREEN_WIDTH-self.personLab.frame.origin.x, 1)];
//        _separator.backgroundColor = UIColor.grayColor;
//    }
//    return _separator;
//}

@end
