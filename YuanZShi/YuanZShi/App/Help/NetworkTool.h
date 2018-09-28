//
//  NetworkTool.h
//  04AFNetworking
//
//  Created by 疏影浮生 on 2017/6/19.
//  Copyright © 2017年 疏影浮生. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkTool : AFHTTPSessionManager

/**
 网络中间层的请求的结口

 @param urlStr 要发起请求的url的地址
 @param parameters 请求的数据参数，可能是字典或者数组，也可能是nil
 @param method 请求方式， post或者get
 @param competetion 请求完成后的回调的block
 */
- (void) requestWithURL:(NSString *) urlStr parameters:(id)parameters method: (NSString *) method competetion: (void(^)(id resonseObject))competetion;


/**
 单例
 */
+ (instancetype) sharedTool;

@end
