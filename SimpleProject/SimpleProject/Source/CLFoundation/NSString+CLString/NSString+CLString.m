//
//  NSString+CLString.m
//  SimpleProject
//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSString+CLString.h"

@implementation NSString (CLString)

+ (NSInteger)cl_getNumberWithString:(NSString *)string {
    
    NSCharacterSet *characterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    return [[string stringByTrimmingCharactersInSet:characterSet] intValue];
}

@end
