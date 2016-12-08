//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIDevice+CLDevice.h
//  CLFoundation
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CLDevice)

/**
 *  获取系统版本号
 *
 *  @return 返回系统版本号
 */
+ (NSString *)cl_getSystemVersion;

/**
 *  获取设备名称
 *
 *  @return 返回真机或模拟器设备名称
 */
+ (NSString *)cl_getDeviceName;

/**
 *  获取设备类型
 *
 *  @return 返回iPhone, iPod Touch, iPad其中之一的设备类型
 */
+ (NSString *)cl_getDeviceModelType;

@end
