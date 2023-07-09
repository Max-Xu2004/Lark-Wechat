//
//  SessionManager.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import "SessionManager.h"
#import "FriendModel.h"

@implementation SessionManager



+(void)getDataWithStuNum:(NSString *)stuNum
                   Success:(void(^)(NSArray *array))success
                   Failure:(void(^)(void)) failure{
    NSString *stu = stuNum;
    NSString *apiString = [apiPrefix stringByAppendingString:stu];
//    NSLog(@"链接%@",apiString);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//
//                //设置允许不受信任的证书
//                securityPolicy.allowInvalidCertificates = YES;
//                //设置不验证域名
//                securityPolicy.validatesDomainName = NO;
//
//            manager.securityPolicy = securityPolicy;


    [manager GET:(apiString) parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray<NSDictionary *> *dataArray = responseObject[@"data"];
        if([dataArray count]>0){
            FriendModel *model = [FriendModel friendModelWithDict:dataArray[0]];
            NSArray *rArray = [[NSArray alloc] initWithObjects:model, nil];
            if(success) success(rArray.copy);
        }
        else{
            if(success) success(dataArray.copy);
        }

        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"访问失败%@",error);
        }];
}

@end
