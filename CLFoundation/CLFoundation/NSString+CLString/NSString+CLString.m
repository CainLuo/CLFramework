//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  NSString+CLString.m
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

+ (NSString*)cl_getSecrectStringWithPhoneNumber:(NSString *)phoneNumber {
    
    NSMutableString *newStr = [NSMutableString stringWithString:phoneNumber];
    
    NSRange range = NSMakeRange(3, 4);
    
    [newStr replaceCharactersInRange:range
                          withString:@"****"];
    
    return newStr;
}

+ (NSString *)cl_getSecrectStringWithCardNumber:(NSString *)cardNumber {
    
    NSMutableString *newStr = [NSMutableString stringWithString:cardNumber];
    
    NSRange range = NSMakeRange(4, 8);
    
    if (newStr.length > 12) {
        
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    
    return newStr;
}

- (CGFloat)cl_heightWithFontSize:(CGFloat)fontSize
                           width:(CGFloat)width {
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                            attributes:attributes
                               context:nil].size.height;
}

- (NSString *)cl_removeUnwantedZero {
    
    if ([[self substringWithRange:NSMakeRange(self.length - 3, 3)] isEqualToString:@"000"]) {
        
        return [self substringWithRange:NSMakeRange(0, self.length - 4)]; // 多一个小数点
        
    } else if ([[self substringWithRange:NSMakeRange(self.length - 2, 2)] isEqualToString:@"00"]) {
        
        return [self substringWithRange:NSMakeRange(0, self.length - 2)];
        
    } else if ([[self substringWithRange:NSMakeRange(self.length - 1, 1)] isEqualToString:@"0"]) {
        
        return [self substringWithRange:NSMakeRange(0, self.length - 1)];
    } else {
        return self;
    }
}

- (NSString *)cl_trimmedString {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

@end
