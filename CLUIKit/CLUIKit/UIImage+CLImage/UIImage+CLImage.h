//
//  UIImage+CLImage.h
//  CLUIKit
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CLImage)

/**
 截取指定视图大小的截图

 @param view 指定视图
 @return 图片
 */
+ (UIImage *)cl_getImageForView:(UIView *)view;

/**
 加载指定名称的GIF图片
 
 @param name 图片名
 @return 图片
 */
+ (UIImage *)cl_loadGIFImageForName:(NSString *)name;

/**
 从NSData里加载GIF图片
 
 @param data 图片数据
 @return 图片
 */
+ (UIImage *)cl_loadGIFImageWithData:(NSData *)data;

/**
 缩放指定比例的图片

 @param size 指定比例
 @return 图片
 */
- (UIImage *)cl_animatedImageByScalingAndCroppingToSize:(CGSize)size;

/**
 输入一张图片, 返回一张带高斯模糊的图片
 
 @param blur 模糊值
 @return 图片
 */
- (UIImage *)cl_blurImageWithBlur:(CGFloat)blur;

@end
