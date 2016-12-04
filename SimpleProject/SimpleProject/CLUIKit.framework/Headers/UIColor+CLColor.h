//
//  UIColor+CLColor.h
//  CLFoundation
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CLColor)

/**
 *  获取随机色值
 *
 *  @return 返回随机色值的UIColor
 */
+ (UIColor *)cl_getARC4RandomColor;

/**
 *  十六进制转UIColor
 *
 *  @param hexValue   十六进制颜色值
 *  @param alphaValue 透明度
 *
 *  @return 返回十六进制转成的UIColor
 */
+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue
                    alpha:(CGFloat)alphaValue;

/**
 *  十六进制转UIColor
 *
 *  @param hexValue 十六进制颜色值
 *
 *  @return 返回十六进制转成的UIColor
 */
+ (UIColor *)cl_colorWithHex:(NSInteger)hexValue;

+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha;

+ (UIColor *)cl_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue;

@end
