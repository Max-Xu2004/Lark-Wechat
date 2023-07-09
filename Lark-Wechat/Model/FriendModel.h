//
//  FriendModel.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendModel : NSObject

@property (nonatomic,copy) NSString *stunum;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *classnum;
@property (nonatomic,copy) NSString *major;
@property (nonatomic,copy) NSString *grade;

-(instancetype)friendModelWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
