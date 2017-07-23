//
//  NSDate+CLDate.h
//  SimpleProject
//
//  Created by Cain on 2017/7/14.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CLDate)

/**
 通过时间戳计算出与当前时间差

 @param timeStamp 时间戳
 @return 与当前时间的差距, 比如一天前
 */
+ (NSString *)compareCureentTimeWithDate:(NSTimeInterval)timeStamp;


/**
 通过传入的时间戳算出年月日

 @param timeStamp 时间戳
 @return 年月日, 默认格式xxxx年xx月xx日
 */
+ (NSString *)displayTimeWithTimeStamp:(NSTimeInterval)timeStamp;


/**
 通过传入的时间戳和日期格式算出年月日

 @param timeStamp 时间戳
 @param formatter 时间显示格式
 @return 年月日
 */
+ (NSString *)displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                             formatter:(NSString *)formatter;

@end
