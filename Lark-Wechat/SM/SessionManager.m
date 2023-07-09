//
//  SessionManager.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import "SessionManager.h"
#import "FriendModel.h"

@implementation SessionManager

+(void)getDatawithapiURL:(NSString *)api
                   Success:(void(^)(NSArray *array))success
                   Failure:(void(^)(void)) failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:(api) parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSMutableArray *mArray = [NSMutableArray array];
        NSDictionary *dict = responseObject[@"data"];
        
        if ((dict = NULL)) failure();//本行不确定是否可行
        
        FriendModel *model = [[FriendModel alloc] init];
        [model friendModelWithDic:dict];
        NSArray *rArray = [[NSArray alloc] initWithObjects:model, nil];
//        [mArray addObject:model];
        
//        for(NSDictionary *dict in responseObject[@"stories"]){
//            FriendModel *model = [[FriendModel alloc] init];
//            [model friendModelWithDic:dict];
//            [mArray addObject:model];
//        }
        if(success) success(rArray.copy);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        }];
}

+(void)getDataWithStuNum:(NSString *)stuNum
                   Success:(void(^)(NSArray *array))success
                   Failure:(void(^)(void)) failure{
    NSString *apiString = [APIPREFIX stringByAppendingString:stuNum];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:(apiString) parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = responseObject[@"data"];
        
        if ((dict = NULL)) failure();//本行不确定是否可行
        
        FriendModel *model = [[FriendModel alloc] init];
        [model friendModelWithDic:dict];
        NSArray *rArray = [[NSArray alloc] initWithObjects:model, nil];

        if(success) success(rArray.copy);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        }];
}

@end
