//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIImageView+CLImageView.h
//
//  Created by Cain on 2016/12/8.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CLImageView)

/**
 创建一个二维码

 @param string 二维码的内容
 */
- (void)createQRCodeImageWithString:(NSString *)string;

/**
 创建一个二维码, 且可以添加中间的Logo图

 @param string 二维码内容
 @param logoName logo图 default size is 150 * 150
 */
- (void)createQRCodeImageWithString:(NSString *)string
                               logo:(NSString *)logoName;

/**
 创建一个条形码

 @param string 条形码内容, 只能输入ASCII字符
 */
- (void)create128BarcodeImageWithString:(NSString *)string;

/**
 创建一个条形码, 并且可以设置条形码与UIImageView两边的间距

 @param string 条形码内容, 只能输入ASCII字符
 @param space 与UIImageView两边的距离
 */
- (void)create128BarcodeImageWithString:(NSString *)string
                                  space:(CGFloat)space;

@end
