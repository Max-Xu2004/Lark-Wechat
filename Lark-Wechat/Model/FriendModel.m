//
//  FriendModel.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import "FriendModel.h"
#import "transformChineseToPinyin.h"

@implementation FriendModel

+ (instancetype)friendModelWithDict:(NSDictionary *)dict{
    FriendModel *model = [[FriendModel alloc] init];
    model.stunum = dict[@"stunum"];
    model.name = dict[@"name"];
    model.gender = dict[@"gender"];
    model.classnum = dict[@"classnum"];
    model.major = dict[@"major"];
    model.grade = dict[@"grade"];
    model.pinyin = [transformChineseToPinyin transformChineseToPinyin:model.name];
    
    return model;
}

@end
