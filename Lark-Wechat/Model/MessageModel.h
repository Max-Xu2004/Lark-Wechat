//
//  MessageModel.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageModel : NSObject

@property (nonatomic,copy) NSString *person;

@property (nonatomic,copy) NSString *text;

@property (nonatomic,copy) NSString *imgName;

@property (nonatomic,copy) NSString *date;

///是否屏蔽此人消息
@property (nonatomic) NSNumber *bell;

///字典转模型
-(instancetype)messageModelWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
