//
//  FriendModel.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import "FriendModel.h"

@implementation FriendModel

- (instancetype)friendModelWithDic:(NSDictionary *)dic{
    FriendModel *model = [[FriendModel alloc] init];
    model.stunum = dic[@"stunum"];
    model.name = dic[@"name"];
    model.gender = dic[@"gender"];
    model.classnum = dic[@"classnum"];
    model.major = dic[@"major"];
    model.grade = dic[@"grade"];
    return model;
}

@end
