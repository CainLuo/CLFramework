//
//  NSURL+CLURL.m
//  SimpleProject
//
//  Created by Cain on 2017/7/10.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "NSURL+CLURL.h"
#import <UIKit/UIKit.h>

@implementation NSURL (CLURL)

+ (void)cl_openBrowserWithURL:(NSString *)urlString {
    
    [[UIApplication sharedApplication] openURL:[self URLWithString:urlString]];
}

@end
