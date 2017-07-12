//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIDevice+CLDevice.m
//  CLFoundation
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIDevice+CLDevice.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation UIDevice (CLDevice)

+ (NSString *)cl_getSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)cl_getDeviceName {
    
    return [[UIDevice currentDevice] name];
}

+ (NSString *)cl_getDeviceModelType {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)cl_getUUIDString {
    
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (NSString *)cl_getCarrierName {
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    return [NSString stringWithFormat:@"%@", [carrier carrierName]];
}

+ (NSString *)cl_getCurrentRadioAccessTechnology {
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    return [[NSString alloc] initWithFormat:@"%@", info.currentRadioAccessTechnology];
}

@end
