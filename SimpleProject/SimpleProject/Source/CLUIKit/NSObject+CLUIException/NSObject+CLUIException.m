//
//  NSObject+CLUIException.m
//  SimpleProject
//
//  Created by Cain on 2017/8/27.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSObject+CLUIException.h"

@implementation NSObject (CLUIException)

+ (void)load {
    
    [self cl_checkBundID];
}

+ (void)cl_checkBundID {
    
    NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
    
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
