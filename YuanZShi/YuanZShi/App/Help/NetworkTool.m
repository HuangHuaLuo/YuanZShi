//
//  NetworkTool.m
//  04AFNetworking
//
//  Created by ItHeiMa on 2017/6/19.
//  Copyright © 2017年 itHeima. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool


+ (instancetype) sharedTool {
    static NetworkTool * instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithBaseURL:nil];
        //代表指示AFN可以接受的服务器返回的数据类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    });
    
    return instance;
}

- (void) requestWithURL:(NSString *) urlStr
             parameters:(id)parameters
                 method: (NSString *) method
            competetion: (void(^)(id resonseObject))competetion {
    //当发起get请求，就调用AFN的get方法
    if ([method isEqualToString:@"GET"]) {
        [self GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            //如果成功了，将AFN返回的数据，原封不动地传给调用者
            competetion(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            //如果请求失败了，传一个nil，给调用者，让其结束请求的状态（结束菊花的转动）
            competetion(nil);
        }];
    }
    //当发起post请求，就调用AFN的post方法
    else if ([method isEqualToString:@"POST"]) {
        [self POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            competetion(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            competetion(nil);
        }];
    }
}

@end
