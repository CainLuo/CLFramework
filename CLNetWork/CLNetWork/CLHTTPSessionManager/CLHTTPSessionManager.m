//
//  CLHTTPSessionManager.m
//  CLNetWork
//
//  Created by Cain Luo on 2017/10/31.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLHTTPSessionManager.h"

@interface CLHTTPSessionManager()

@property (nonatomic, strong) NSDictionary *es_headers;

@end

@implementation CLHTTPSessionManager

+ (CLHTTPSessionManager *)cl_shareInstance {
    
    static CLHTTPSessionManager *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] initWithBaseURL:[NSURL URLWithString:CL_BASE_URL]];
    });
    
    return instance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    
    if (self) {
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
    }
    
    return self;
}

#pragma mark - 带进度条的
+ (void)cl_getRequestURLString:(NSString *)urlString
                    parameters:(NSDictionary *)parameters
                      progress:(CLDownloadProgress)progress
                       success:(CLSuccess)success
                       failure:(CLFailure)failure {
    
    [[CLHTTPSessionManager cl_shareInstance] GET:urlString
                                      parameters:parameters
                                        progress:^(NSProgress * _Nonnull downloadProgress) {
                                            
                                            if (progress) {
                                                progress(downloadProgress);
                                            }
                                            
                                        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                            
                                            if (success) {
                                                
                                                success(task, responseObject);
                                            }
                                            
                                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                            
                                            if (failure) {
                                                
                                                failure(task, error);
                                            }
                                        }];
}

+ (void)cl_postRequestURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                       progress:(CLDownloadProgress)progress
                        success:(CLSuccess)success
                        failure:(CLFailure)failure {
    
    [[CLHTTPSessionManager cl_shareInstance] POST:urlString
                                       parameters:parameters
                                         progress:^(NSProgress * _Nonnull downloadProgress) {
                                             
                                             if (progress) {
                                                 progress(downloadProgress);
                                             }
                                         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                             
                                             if (success) {
                                                 
                                                 success(task, responseObject);
                                             }
                                             
                                         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                             
                                             if (failure) {
                                                 
                                                 failure(task, error);
                                             }
                                         }];
}

#pragma mark - 不带进度条的
+ (void)cl_getRequestURLString:(NSString *)urlString
                    parameters:(NSDictionary *)parameters
                       success:(CLSuccess)success
                       failure:(CLFailure)failure {
    
    [self cl_getRequestURLString:urlString
                      parameters:parameters
                        progress:nil
                         success:^(NSURLSessionDataTask *task, id responseObject) {
                             
                             if (success) {
                                 
                                 success(task, responseObject);
                             }
                             
                         } failure:^(NSURLSessionDataTask *task, NSError *error) {
                             
                             if (failure) {
                                 
                                 failure(task, error);
                             }
                         }];
}

+ (void)cl_postRequestURLString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
                        success:(CLSuccess)success
                        failure:(CLFailure)failure {
    
    [self cl_postRequestURLString:urlString
                       parameters:parameters
                         progress:nil
                          success:^(NSURLSessionDataTask *task, id responseObject) {
                              
                              if (success) {
                                  
                                  success(task, responseObject);
                              }
                              
                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                              
                              if (failure) {
                                  
                                  failure(task, error);
                              }
                          }];
}

@end


