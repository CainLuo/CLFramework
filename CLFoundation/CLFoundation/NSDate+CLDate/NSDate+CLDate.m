//
//  NSDate+CLDate.m
//  SimpleProject
//
//  Created by Cain on 2017/7/14.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSDate+CLDate.h"

@implementation NSDate (CLDate)

+ (NSString *)compareCureentTimeWithDate:(NSTimeInterval)timeStamp {
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp / 1000];
    
    NSTimeInterval  timeInterval = [confromTimesp timeIntervalSinceNow];
    
    timeInterval = -timeInterval;
    
    NSInteger temp = 0;
    
    NSString *result;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags  = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents*referenceComponents = [calendar components:unitFlags
                                                       fromDate:confromTimesp];
    
//        NSInteger referenceYear  = referenceComponents.year;
//        NSInteger referenceMonth = referenceComponents.month;
//        NSInteger referenceDay   = referenceComponents.day;
    NSInteger referenceHour = referenceComponents.hour;
//        NSInteger referemceMinute = referenceComponents.minute;
    
    if (timeInterval < 60) {
        
        result = [NSString stringWithFormat:@"刚刚"];
        
    } else if((temp= timeInterval / 60) < 60){
        
        result = [NSString stringWithFormat:@"%ld分钟前", temp];
        
    } else if((temp = timeInterval / 3600) < 24){
        
        result = [NSString stringWithFormat:@"%ld小时前", temp];
        
    } else if ((temp = timeInterval / 3600 / 24) == 1) {
        
        result = [NSString stringWithFormat:@"昨天%ld时", referenceHour];
        
    } else if ((temp = timeInterval / 3600 / 24) == 2) {
        
        result = [NSString stringWithFormat:@"前天%ld时", referenceHour];
        
    } else if((temp = timeInterval / 3600 / 24) < 31){
        
        result = [NSString stringWithFormat:@"%ld天前", temp];
        
    } else if((temp = timeInterval / 3600 / 24 / 30) <12){
        
        result = [NSString stringWithFormat:@"%ld个月前",temp];
        
    } else {
        
        temp = temp / 12;
        
        result = [NSString stringWithFormat:@"%ld年前", temp];
    }
    
    return  result;
}

+ (NSString *)displayTimeWithTimeStamp:(NSTimeInterval)timeStamp {
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp / 1000];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *referenceComponents=[calendar components:unitFlags
                                                      fromDate:confromTimesp];
    
    NSInteger referenceYear  = referenceComponents.year;
    NSInteger referenceMonth = referenceComponents.month;
    NSInteger referenceDay   = referenceComponents.day;
    
    return [NSString stringWithFormat:@"%ld年%ld月%ld日", referenceYear, referenceMonth, referenceDay];
}


+ (NSString *)displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                             formatter:(NSString *)formatter {
    
    if ([NSString stringWithFormat:@"%@", @(timeStamp)].length == 13) {
        
        timeStamp /= 1000.0f;
    }
    
    NSDate *timestampDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:formatter];
    
    NSString *dateString = [dateFormatter stringFromDate:timestampDate];
    
    return dateString;
}

@end
