//
//  CLHTTPSessionManager.h
//  CLNetWork
//
//  Created by Cain Luo on 2017/10/31.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "AFNetworking.h"

#define CL_BASE_URL @"http://www.baidu.com"

typedef void (^CLDownloadProgress)(NSProgress *progress);
typedef void (^CLSuccess)(NSURLSessionDataTask *task, id responseObject);
typedef void (^CLFailure)(NSURLSessionDataTask *task, NSError *error);

@interface CLHTTPSessionManager : AFHTTPSessionManager

+ (CLHTTPSessionManager *)cl_shareInstance;

/**
 带进度条的GET请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param progress 进度
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)cl_getRequestURLString:(NSString *)urlString
                    parameters:(NSDictionary *)parameters
                      progress:(CLDownloadProgress)progress
                       success:(CLSuccess)success
                       failure:(CLFailure)failure;

/**
 带进度条的POST请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param progress 进度
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)cl_postRequestURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                       progress:(CLDownloadProgress)progress
                        success:(CLSuccess)success
                        failure:(CLFailure)failure;

/**
 不带进度条的GET请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)cl_getRequestURLString:(NSString *)urlString
                    parameters:(NSDictionary *)parameters
                       success:(CLSuccess)success
                       failure:(CLFailure)failure;

/**
 不带进度条的POST请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)cl_postRequestURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                        success:(CLSuccess)success
                        failure:(CLFailure)failure;

@end

