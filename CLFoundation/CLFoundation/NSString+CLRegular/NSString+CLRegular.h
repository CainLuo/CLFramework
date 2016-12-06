//
//  NSString+CLRegular.h
//  CLFoundation
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CLRegular)

#pragma mark - Test Numbers
/**
 当前字符是否为数字

 @return bool
 */
- (BOOL)cal_isNumber;

/**
 当前字符是否为number位的数字

 @param quantity 限制数字的数量
 @return bool
 */
- (BOOL)cal_checkMoreNumber:(NSInteger)quantity;

/**
 当前字符是否为 至少number位的数字

 @param quantity 至少数字的数量
 @return bool
 */
- (BOOL)cal_checkAtLeastNumber:(NSInteger)quantity;

/*!
 *	@brief  当前字符是否为 fistNumber-scondNumber位的数字
 *  @param  fistNumber  开始
 *  @param  lastNumber  结束
 */
- (BOOL)cal_checkLimitsNumber:(NSInteger)fistNumber lastNumber:(NSInteger)lastNumber;

/*!
	@brief  当前字符是否为 非零开头的数字
 
 */
- (BOOL)cal_isNonZeroStartNumber;

/*!
	@brief  当前字符是否为 非零开头的最多带两位小数的数字
 
 */
- (BOOL)cal_isNonZeroStartNumberHaveOneOrTwoDecimal;

/*!
	@brief  当前字符是否为 带1-2位小数的正数或负数
 
 */
- (BOOL)cal_isHaveOneOrTwoDecimalPositiveOrNegative;

/*!
	@brief  当前字符是否为 正数、负数、和小数
 
 */
- (BOOL)cal_realContainDecimal;

/*!
	@brief  当前字符是否为 有两位小数的正实数
 
 */
- (BOOL)cal_isPositiveRealHaveTwoDecimal;

/*!
	@brief  当前字符是否为 有1~3位小数的正实数
 
 */
- (BOOL)cal_isHaveOneOrThreeDecimalPositiveOrNegative;

/*!
	@brief  当前字符是否为 非零的正整数
 
 */
- (BOOL)cal_isNonZeroPositiveInteger;

/*!
	@brief  当前字符是否为 非零的负整数
 
 */
- (BOOL)cal_isNonZeroNegativeInteger;

/*!
	@brief  当前字符是否为 非负整数
 */
- (BOOL)cal_isNonNegativeInteger;

/*!
	@brief  当前字符是否为 非正整数
 */
- (BOOL)cal_isNonPositiveInteger;

#pragma mark - Test Float

/*!
	@brief  当前字符是否为 非负浮点数
 */
- (BOOL)cal_isNonNegativeFloat;

/*!
	@brief  当前字符是否为 非正浮点数
 */
- (BOOL)cal_isNonPositiveFloat;

/*!
	@brief  当前字符是否为 正浮点数
 */
- (BOOL)cal_isPositiveFloat;

/*!
	@brief  当前字符是否为 负浮点数
 */
- (BOOL)cal_isNagativeFloat;

/*!
	@brief  当前字符是否为 浮点数
 */
- (BOOL)cal_isFloat;

#pragma mark - Test String

/*!
	@brief  当前字符是否为 汉字
 */
- (BOOL)cal_isChineseCharacter;

/*!
	@brief  当前字符是否为 由数字和26个英文字母组成的字符串
 */
- (BOOL)cal_isEnglishAndNumbers;

/**
 当前字符是否为 长度为3-20的所有字符

 @param fistRange 开始的范围
 @param lastRange 结束的范围
 @return bool
 */
- (BOOL)cal_limitinglength:(NSInteger)fistRange lastRange:(NSInteger)lastRange;

/**
 当前字符长度是否位 length, 并且是由字母和数字所组成

 @param length length 字符的长度
 @return bool
 */
- (BOOL)cal_checkString:(NSInteger)length;

/*!
	@brief  当前字符是否为 由26个英文字母组成的字符串
 */
- (BOOL)cal_isLettersString;

/*!
	@brief  当前字符是否为 由26个大写英文字母组成的字符串
 */
- (BOOL)cal_isCapitalLetters;

/*!
	@brief  当前字符是否为 由26个小写英文字母组成的字符串
 */
- (BOOL)cal_isLowercaseLetters;

/*!
	@brief  当前字符是否为 由数字、26个英文字母或者下划线组成的字符串
 */
- (BOOL)cal_isNumbersAndLettersOrUnderlineString;

/*!
	@brief  当前字符是否为 中文、英文、数字包括下划线
 */
- (BOOL)cal_isChineseCharacterAndEnglishAndNumbersAndUnderlineString;

/*!
	@brief  当前字符是否为 中文、英文、数字但不包括下划线等符号
 */
- (BOOL)cal_isDoesNotContainUnderscoresChineseCharacterAndEnglishAndNumbersString;

/*!
	@brief  当前字符是否可以输入 含有^%&',;=?$\"等字符
 */
- (BOOL)cal_isContainSpecialCharacterString;

/*!
 *	@brief  当前字符是否禁止输入 含有charater的字符
 *  @param  charater  输入限制的字符
 */
- (BOOL)cal_isContainCharacter:(NSString *)charater;

/**
 *  判断当前字符串是否是字母开头
 *
 *  @return BOOL
 */
- (BOOL)cal_isLetterStar;

/**
 *  判断当前字符串是否是字母, 数字及下划线的组合
 *
 *  @return BOOL
 */
- (BOOL)cal_checkStringIsStrong;

#pragma mark - Special Needs

/*!
	@brief  当前字符是否为 Email地址
 */
- (BOOL)cal_checkEmailAddress;

/*!
	@brief  当前字符是否为 域名
 */
- (BOOL)cal_checkDomainName;

/*!
	@brief  当前字符是否为 InternetURL
 */
- (BOOL)cal_checkURL;

/*!
	@brief  当前字符是否为 手机号码
 */
- (BOOL)cal_checkPhoneNumber;

/*!
	@brief  当前字符是否为 中国移动手机号
 */
- (BOOL)cal_checkChinaMobelPhoneNumber;

/*!
	@brief  当前字符是否为 中国联通手机号
 */
- (BOOL)cal_checkChinaUnicomPhoneNumber;

/*!
	@brief  当前字符是否为 中国电信手机号
 */
- (BOOL)cal_checkChinaTelecomPhoneNumber;

/*!
	@brief  当前字符是否为 电话号码("XXX-XXXXXXX"、"XXXX-XXXXXXXX"、"XXX-XXXXXXX"、"XXX-XXXXXXXX"、"XXXXXXX"和"XXXXXXXX)
 */
- (BOOL)cal_checkTelePhoneNumber;

/*!
	@brief  当前字符是否为 国内电话号码(0511-4405222、021-87888822)
 */
- (BOOL)cal_checkDomesticPhoneNumber;

/*!
	@brief  当前字符是否为 身份证号(15位、18位数字)
 */
- (BOOL)cal_checkIdentityCard;

/*!
	@brief  当前字符是否为 短身份证号码(数字、字母x结尾)
 */
- (BOOL)cal_checkShortIdentityCard;

/*!
	@brief  当前字符是否为 帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)
 */
- (BOOL)cal_checkAccount;

/*!
	@brief  当前字符是否为 密码(以字母开头，长度在6~18之间, 并且密码是从0开始，只能包含字母、数字和下划线)
 */
- (BOOL)cal_checkPassword;

/*!
 *	@brief  当前字符是否为 强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：briefest指的是最短密码长度, longest指的时最长密码长度
 *  @param  briefest  密码最短的长度
 *  @param  longest   密码最长的长度
 */
- (BOOL)cal_checkStrongPassword:(NSInteger)briefest longest:(NSInteger)longest;

/*!
	@brief  当前字符是否为 中国日期格式
 */
- (BOOL)cal_checkChinaDateFormat;

/*!
	@brief  当前字符是否为 国外日期格式
 */
- (BOOL)cal_checkAbroadDateFormat;

/*!
	@brief  当前字符是否为 一年的12个月(01～09和1～12)
 */
- (BOOL)cal_checkMonth;

/*!
	@brief  当前字符是否为 一个月的31天(01～09和1～31)
 */
- (BOOL)cal_checkDay;

/*!
	@brief  当前字符是否为 xml文件
 */
- (BOOL)cal_checkXMLFile;

/*!
	@brief  当前字符是否为 中文字符的正则表达式
 */
- (BOOL)cal_checkChineseCharacter;

/*!
	@brief  当前字符是否为 双字节字符：(包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1))
 */
- (BOOL)cal_checkDoubleByteCharacters;

/*!
	@brief  当前字符是否为 空白行的正则表达式：(判断是否有空白行)
 */
- (BOOL)cal_checkBlankLines;

/*!
	@brief  当前字符是否为 HTML标记的正则表达式：(网上流传的版本太糟糕，上面这个也仅仅能部分，对于复杂的嵌套标记依旧无能为力)
 */
- (BOOL)cal_checkHTMLSign;

/*!
	@brief  当前字符是否为 首尾空白字符的正则表达式：(可以用来删除行首行尾的空白字符(包括空格、制表符、换页符等等)，非常有用的表达式)
 */
- (BOOL)cal_checkFirstAndLastSpaceCharacters;

/*!
	@brief  当前字符是否为 腾讯QQ号：(腾讯QQ号从10000开始)
 */
- (BOOL)cal_checkQQNumber;

/*!
	@brief  当前字符是否为 中国邮政编码：(中国邮政编码为6位数字)
 */
- (BOOL)cal_checkPostalCode;

/*!
	@brief  当前字符是否为 IP地址
 */
- (BOOL)cal_checkIPv4InternetProtocol;

@end
