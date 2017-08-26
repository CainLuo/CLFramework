//
//  NSMutableAttributedString+CLMutableAttributedString.m
//  SimpleProject
//
//  Created by Cain on 2017/8/26.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSMutableAttributedString+CLMutableAttributedString.h"

@implementation NSMutableAttributedString (CLMutableAttributedString)

+ (NSMutableAttributedString *)cl_attributeStringWithPrefixString:(NSString *)prefixString
                                                 subffixImageName:(NSString *)subffixImageName {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:prefixString];
    
    UIImage *image = [UIImage imageNamed:subffixImageName];
    
    NSTextAttachment *backAttachment = [[NSTextAttachment alloc] init];
    
    backAttachment.image = image;
    backAttachment.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
    
    NSAttributedString *backString = [NSAttributedString attributedStringWithAttachment:backAttachment];
    
    [mutableAttributedString appendAttributedString:backString];
    
    return mutableAttributedString;
}

+ (NSMutableAttributedString *)cl_attributeStringWithSubffixString:(NSString *)subffixString
                                                   prefixImageName:(NSString *)prefixImageName {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:subffixString];
    
    UIImage *image = [UIImage imageNamed:prefixImageName];
    NSTextAttachment *backAttachment = [[NSTextAttachment alloc] init];
    
    backAttachment.image = image;
    backAttachment.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
    
    NSAttributedString *backString = [NSAttributedString attributedStringWithAttachment:backAttachment];
    
    [mutableAttributedString appendAttributedString:backString];
    [mutableAttributedString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:subffixString]];
    
    return mutableAttributedString;
    
}

@end
