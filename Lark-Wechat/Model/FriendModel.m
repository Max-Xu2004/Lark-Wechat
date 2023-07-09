//
//  FriendModel.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import "FriendModel.h"

@implementation FriendModel

+ (instancetype)friendModelWithDict:(NSDictionary *)dict{
    FriendModel *model = [[FriendModel alloc] init];
    model.stunum = dict[@"stunum"];
    model.name = dict[@"name"];
    model.gender = dict[@"gender"];
    model.classnum = dict[@"classnum"];
    model.major = dict[@"major"];
    model.grade = dict[@"grade"];
//    model.pingyin = [PinyinHelper toHanyuPinyinStringWithNSString:model.name withHanyuPinyinOutputFormat:nil withNSString:@""];
//    NSLog(@"拼音：%@",[PinyinHelper toHanyuPinyinStringWithNSString:model.name withHanyuPinyinOutputFormat:nil withNSString:@""]);
    
    
    return model;
}



@end
