//
//  transformChineseToPinyin.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/10.
//

#import "transformChineseToPinyin.h"

@implementation transformChineseToPinyin

// 汉字转拼音
+ (NSString *)transformChineseToPinyin:(NSString *)chinese{
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [chinese mutableCopy];

    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);

    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);

    //返回最近结果
    return pinyin;

}

@end
