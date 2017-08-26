//
//  NSMutableAttributedString+CLMutableAttributedString.h
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (CLMutableAttributedString)

/**
 添加图片在字符串之前

 @param prefixString     富文本
 @param subffixImageName 图片名
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                 subffixImageName:(NSString *)subffixImageName;

/**
 添加图片在字符串之后

 @param subffixString 字符串
 @param prefixImageName 图片名
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                   prefixImageName:(NSString *)prefixImageName;

@end
