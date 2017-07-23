//
//  NSURL+CLURL.h
//  SimpleProject
//
//  Created by Cain on 2017/7/10.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (CLURL)

/**
 通过传入的URL地址打开外部浏览器

 @param urlString URL地址
 */
+ (void)cl_openBrowserWithURL:(NSString *)urlString;

@end
