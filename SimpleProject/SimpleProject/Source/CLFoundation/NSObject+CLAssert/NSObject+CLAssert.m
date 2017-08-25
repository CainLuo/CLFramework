//
//  NSObject+CLAssert.m
//  SimpleProject
//
//  Created by Cain on 2017/8/25.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSObject+CLAssert.h"
#import "NSBundle+CLBundle.h"

@implementation NSObject (CLAssert)

+ (void)load {
    
    [self cl_checkBundID];
}

+ (void)cl_checkBundID {
    
    if (![[NSBundle cl_getBundleIdentifier] isEqualToString:@"com.CainLuo.SimpleProject"]) {
        
        @throw [NSException exceptionWithName:@"来自Framework的异常"
                                       reason:@"您没有权限使用该框架"
                                     userInfo:nil];
    }
}

@end
