//
//  NSAttributedString+CLAttributedString.h
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (CLAttributedString)

/**
 根据富文本的宽度返回文字的高度

 @param width 宽度
 @return CGFloat
 */
- (CGFloat)cl_attributedStringHeightWithContainWidth:(CGFloat)width;

/**
 返回设置好的NSAttributedString

 @param prefixString 前缀字符串
 @param suffixString 后缀字符串
 @return NSAttributedString
 */
+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                           suffixString:(NSString *)suffixString;

/**
 返回设置好的NSAttributedString

 @param prefixString 前缀String
 @param prefixFont   前缀字体大小
 @param prefixColor  前缀字体颜色
 @param suffixString 尾缀String
 @param suffixFont   尾缀字体大小
 @param suffixColor  尾缀字体颜色
 @return NSAttributedString
 */
+ (NSAttributedString *)attributeStringWithPrefixString:(NSString *)prefixString
                                             prefixFont:(CGFloat)prefixFont
                                            prefixColor:(UInt32)prefixColor
                                           suffixString:(NSString *)suffixString
                                             suffixFont:(CGFloat)suffixFont
                                            suffixColor:(UInt32)suffixColor;

@end
