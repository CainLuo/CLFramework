//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIImage+CLImage.h
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

/**
 给图片增加圆角

 @param radius 半径
 @return 图片
 */
- (UIImage *)cl_cornerImageWithRadius:(CGFloat)radius;

/**
 给图片增加圆角,边框, 边框的颜色.

 @param radius 半径
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @return 图片
 */
- (UIImage *)cl_cornerImageWithRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;

@end
