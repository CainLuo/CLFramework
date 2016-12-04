//
//  UIDevice+CLDevice.m
//  CLFoundation
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIDevice+CLDevice.h"

@implementation UIDevice (CLDevice)

#pragma mark - 获取系统版本号
+ (NSString *)cl_getSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark - 获取设备名字, 是模拟器还是真机
+ (NSString *)cl_getDeviceName {
    
    return [[UIDevice currentDevice] name];
}

#pragma mark - 获取设备类型
+ (NSString *)cl_getDeviceModelType {
    return [[UIDevice currentDevice] model];
}

@end
