//
//  NSArray+CLArray.h
//  SimpleProject
//
//  Created by Cain on 2017/8/27.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CLArray)

/**
 创建一个安全的Array

 @param object 对象, 可以为nil
 @return NSArray
 */
+ (instancetype)cl_initSafeArrayWithObject:(id)object;

/**
 从数组里获取一个id对象, 索引超出之后, 也不会崩掉

 @param index 对象索引
 @return id
 */
- (id)cl_safeObjectAtIndex:(NSUInteger)index;

/**
 根据Range返回对应的Array

 @param range range, 这里就算超出了索引也不会引起问题
 @return NSArray
 */
- (NSArray *)cl_safeSubarrayWithRange:(NSRange)range;

/**
 根据对象返回对应的索引

 @param object 对象
 @return NSUInteger
 */
- (NSUInteger)cl_safeIndexOfObject:(id)object;

/**
 根据给定的Plist文件名返回里面的数组

 @param name Plist文件名
 @return NSArray
 */
+ (NSArray *)cl_arrayWithPlistName:(NSString *)name;

/**
 将数组转换成JSON字符串

 @return NSString
 */
- (NSString *)cl_jsonStringWithArray;

@end
