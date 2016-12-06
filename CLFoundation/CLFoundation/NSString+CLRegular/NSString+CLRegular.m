//
//  NSString+CLRegular.m
//  CLFoundation
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "NSString+CLRegular.h"

@implementation NSString (CLRegular)

#pragma mark - Test Numbers
// 1
- (BOOL)cal_isNumber {
    
    NSString *rules              = @"^[0-9]*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 2
- (BOOL)cal_checkMoreNumber:(NSInteger)quantity {
    
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld}$", (long)quantity];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 3
- (BOOL)cal_checkAtLeastNumber:(NSInteger)quantity {
    
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld,}$", (long)quantity];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 4
- (BOOL)cal_checkLimitsNumber:(NSInteger)fistNumber lastNumber:(NSInteger)lastNumber {
    
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld,%ld}$", (long)fistNumber, (long)lastNumber];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 5
- (BOOL)cal_isNonZeroStartNumber {
    
    NSString *rules              = @"^(0|[1-9][0-9]*)$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 6
- (BOOL)cal_isNonZeroStartNumberHaveOneOrTwoDecimal {
    
    NSString *rules              = @"^([1-9][0-9]*)+(.[0-9]{1,2})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHRS %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 7
- (BOOL)cal_isHaveOneOrTwoDecimalPositiveOrNegative {
    
    NSString *rules              = @"^(\\-)?\\d+(\\.\\d{1,2})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 8
- (BOOL)cal_realContainDecimal {
    
    NSString *rules              = @"^(\\-|\\+)?\\d+(\\.\\d+)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 9
- (BOOL)cal_isPositiveRealHaveTwoDecimal {
    
    NSString *rules              = @"^[0-9]+(.[0-9]{2})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 10
- (BOOL)cal_isHaveOneOrThreeDecimalPositiveOrNegative {
    
    NSString *rules              = @"^[0-9]+(.[0-9]{1,3})?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 11
- (BOOL)cal_isNonZeroPositiveInteger {
    
    NSString *rules              = @"^[1-9]\\d*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 12
- (BOOL)cal_isNonZeroNegativeInteger {
    
    NSString *rules              = @"^-[1-9]\\d*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 13
- (BOOL)cal_isNonNegativeInteger {
    
    NSString *rules              = @"^\\d+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 14
- (BOOL)cal_isNonPositiveInteger {
    
    NSString *rules              = @"^-[1-9]\\d*";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 15
- (BOOL)cal_isNonNegativeFloat {
    
    NSString *rules              = @"^\\d(\\.\\d+)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 16
- (BOOL)cal_isNonPositiveFloat {
    
    NSString *rules              = @"^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 17
- (BOOL)cal_isPositiveFloat {
    
    NSString *rules              = @"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 18
- (BOOL)cal_isNagativeFloat {
    
    NSString *rules              = @"^-([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*)$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 19
- (BOOL)cal_isFloat {
    
    NSString *rules              = @"^(-?\\d+)(\\.\\d+)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

#pragma mark - Test String
// 1
- (BOOL)cal_isChineseCharacter {
    
    NSString *rules              = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 2
- (BOOL)cal_isEnglishAndNumbers {
    
    NSString *rules              = @"^[A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 3
- (BOOL)cal_limitinglength:(NSInteger)fistRange lastRange:(NSInteger)lastRange {
    
    NSString *rules              = [NSString stringWithFormat:@"^.{%ld,%ld}$", (long)fistRange, (long)lastRange];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 4
- (BOOL)cal_checkString:(NSInteger)length {
    
    NSString *rules              = @"^[A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    if (self.length == length) {
        if ([stringPredicate evaluateWithObject:self]) {
            return YES;
        }
    }
    
    return NO;
}

// 5
- (BOOL)cal_isLettersString {
    
    NSString *rules              = @"^[A-Za-z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 6
- (BOOL)cal_isCapitalLetters {
    
    NSString *rules              = @"^[A-Z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 7
- (BOOL)cal_isLowercaseLetters {
    
    NSString *rules              = @"^[a-z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 8
- (BOOL)cal_isNumbersAndLettersOrUnderlineString {
    
    NSString *rules              = @"^\\w+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 9
- (BOOL)cal_isChineseCharacterAndEnglishAndNumbersAndUnderlineString {
    
    NSString *rules              = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 10
- (BOOL)cal_isDoesNotContainUnderscoresChineseCharacterAndEnglishAndNumbersString {
    
    NSString *rules              = @"^[\u4E00-\u9FA5A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 11
- (BOOL)cal_isContainSpecialCharacterString {
    
    NSString *rules              = @"[^%&',;=?$\x22]+";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 12
- (BOOL)cal_isContainCharacter:(NSString *)charater{
    
    NSString *rules              = [NSString stringWithFormat:@"[^%@\x22]+", charater];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)cal_isLetterStar {
    
    NSString *rules              = @"^[a-zA-Z][a-zA-Z0-9_]*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 14
- (BOOL)cal_checkStringIsStrong {
    
    NSString *rules              = @"^\\w*(?=\\w*\\d)(?=\\w*[a-zA-Z])\\w*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

#pragma mark - Special Needs
// 1
- (BOOL)cal_checkEmailAddress {
    
    NSString *rules              = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 2
- (BOOL)cal_checkDomainName {
    
    NSString *rules              = @"[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 3
- (BOOL)cal_checkURL {
    
    NSString *rules = @"^(http|https|ftp)\\://([a-zA-Z0-9\\.\\-]+(\\:[a-zA-Z0-9\\.&amp;%\\$\\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\\-]+\\.)*[a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,4})(\\:[0-9]+)?(/[^/][a-zA-Z0-9\\.\\,\\?\'\\/\\+&amp;%\\$#\\=~_\\-@]*)*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 4
- (BOOL)cal_checkPhoneNumber {
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs    = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:self] ||
    [regextestphs evaluateWithObject:self]    ||
    [regextestct evaluateWithObject:self]     ||
    [regextestcu evaluateWithObject:self]     ||
    [regextestcm evaluateWithObject:self];
}

// 5
- (BOOL)cal_checkChinaMobelPhoneNumber {
    
    NSString *rules              = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 6
- (BOOL)cal_checkChinaUnicomPhoneNumber {
    
    NSString *rules              = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 7
- (BOOL)cal_checkChinaTelecomPhoneNumber {
    
    NSString *rules              = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 8
- (BOOL)cal_checkTelePhoneNumber {
    
    NSString *rules              = @"^(\\(\\d{3,4}-)|\\d{3.4}-)?\\d{7,8}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 9
- (BOOL)cal_checkDomesticPhoneNumber {
    
    NSString *rules              = @"\\d{3}-\\d{8}|\\d{4}-\\d{7}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 10
- (BOOL)cal_checkIdentityCard {
    
    NSString *rules              = @"^\\d{15}|\\d{18}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 11
- (BOOL)cal_checkShortIdentityCard {
    
    NSString *rules              = @"^([0-9]){7,18}(x|X)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 12
- (BOOL)cal_checkAccount {
    
    NSString *rules              = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 13
- (BOOL)cal_checkPassword {
    
    NSString *rules              = @"^[a-zA-Z]\\w{5,17}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 14
- (BOOL)cal_checkStrongPassword:(NSInteger)briefest longest:(NSInteger)longest {
    
    NSString *rules              = [NSString stringWithFormat:@"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{%ld,%ld}$", (long)briefest, (long)longest];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 15
- (BOOL)cal_checkChinaDateFormat {
    
    NSString *rules              = @"^\\d{4}-\\d{1,2}-\\d{1,2}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 16
- (BOOL)cal_checkAbroadDateFormat {
    
    NSString *rules              = @"^\\d{1,2}-\\d{1,2}-\\d{4}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 17
- (BOOL)cal_checkMonth {
    
    NSString *rules              = @"^(0?[1-9]|1[0-2])$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 18
- (BOOL)cal_checkDay {
    
    NSString *rules              = @"^((0?[1-9])|((1|2)[0-9])|30|31)$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 25
- (BOOL)cal_checkXMLFile {
    
    NSString *rules              = @"^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 26
- (BOOL)cal_checkChineseCharacter {
    
    NSString *rules              = @"[\u4e00-\u9fa5]";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 27
- (BOOL)cal_checkDoubleByteCharacters {
    
    NSString *rules              = @"[^\\x00-\\xff]";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 28
- (BOOL)cal_checkBlankLines {
    
    NSString *rules              = @"\\n\\s*\\r";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 29
- (BOOL)cal_checkHTMLSign {
    
    NSString *rules              = @"<(\\S*?)[^>]*>.*?</\\1>|<.*? />";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
    
}

// 30
- (BOOL)cal_checkFirstAndLastSpaceCharacters {
    
    NSString *rules              = @"^\\s*|\\s*$或(^\\s*)|(\\s*$)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 31
- (BOOL)cal_checkQQNumber {
    
    NSString *rules              = @"[1-9][0-9]{4,}";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 32
- (BOOL)cal_checkPostalCode {
    
    NSString *rules              = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

// 33
- (BOOL)cal_checkIPv4InternetProtocol {
    
    NSString *rules              = @"((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

@end
