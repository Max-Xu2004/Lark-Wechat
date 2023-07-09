//
//  SessionManager.h
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import <AFNetworking/AFNetworking.h>

#define APIPREFIX (@"https://be-dev.redrock.cqupt.edu.cn/magipoke-text/search/people?stu=")
//static NSString *apiPrefix= @"https://news-at.zhihu.com/api/3/stories/before/";

NS_ASSUME_NONNULL_BEGIN

@interface SessionManager : AFHTTPSessionManager

//异步请求数据
+(void)getDatawithapiURL:(NSString *)api
                   Success:(void(^)(NSArray *array))success
                   Failure:(void(^)(void)) failure;

+(void)getDataWithStuNum:(NSString *)stuNum
                   Success:(void(^)(NSArray *array))success
                   Failure:(void(^)(void)) failure;

@end

NS_ASSUME_NONNULL_END
