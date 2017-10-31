//
//  CLHTTPSessionManager.h
//  SimpleProject
//
//  Created by Cain Luo on 2017/10/31.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "AFNetworking.h"

#define FS_BASE_URL @"http://www.baidu.com"

typedef void (^FSDownloadProgress)(NSProgress *progress);
typedef void (^FSSuccess)(NSURLSessionDataTask *task, id responseObject);
typedef void (^FSError)(NSURLSessionDataTask *task, NSError *error);

@interface CLHTTPSessionManager : AFHTTPSessionManager

+ (CLHTTPSessionManager *)fs_shareInstance;

/**
 带进度条的GET请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param progress 进度
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)fs_getRequestURLString:(NSString *)urlString
                    parameters:(NSDictionary *)parameters
                      progress:(FSDownloadProgress)progress
                       success:(FSSuccess)success
                       failure:(FSError)failure;

/**
 带进度条的POST请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param progress 进度
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)fs_postRequestURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                       progress:(FSDownloadProgress)progress
                        success:(FSSuccess)success
                        failure:(FSError)failure;

/**
 不带进度条的GET请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)fs_getRequestURLString:(NSString *)urlString
                    parameters:(NSDictionary *)parameters
                       success:(FSSuccess)success
                       failure:(FSError)failure;

/**
 不带进度条的POST请求
 
 @param urlString 请求URL
 @param parameters 请求参数
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)fs_postRequestURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                        success:(FSSuccess)success
                        failure:(FSError)failure;

@end
