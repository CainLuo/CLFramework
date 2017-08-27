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
    
    NSString *bundleID = [NSBundle cl_getBundleIdentifier];
    
    NSArray *bundleIDArray = @[@"com.CainLuo.SimpleProject",
                               @"com.fishSwimInformation.FishSwimInformation"];
    
    for (NSInteger i = 0; i < bundleIDArray.count; i++) {
        
        if (![bundleID isEqualToString:bundleIDArray[i]]) {
            
            @throw [NSException exceptionWithName:@"Exception from Framework"
                                           reason:@"You do not have permission to use the framework"
                                         userInfo:nil];
            
        }
    }
}

@end
