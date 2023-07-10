//
//  MessageModel.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/7.
//

#import "MessageModel.h"
#import "transformChineseToPinyin.h"

@implementation MessageModel

- (instancetype)messageModelWithDic:(NSDictionary *)dic{
    self.person = dic[@"person"];
    self.text = dic[@"text"];
    self.imgName = dic[@"image"];
    self.date = dic[@"date"];
    self.bell = dic[@"bell"];
    return self;
}

@end
