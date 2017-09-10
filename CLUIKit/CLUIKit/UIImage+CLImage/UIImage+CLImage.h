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
 根据给定的颜色生成一张图

 @param color UIColor
 @return UIImage
 */
+ (UIImage *)cl_getImageWithColor:(UIColor *)color;

/**
 截取指定视图大小的截图

 @param view 指定视图
 @return UIImage
 */
+ (UIImage *)cl_getImageForView:(UIView *)view;

/**
 加载指定名称的GIF图片
 
 @param name 图片名
 @return UIImage
 */
+ (UIImage *)cl_loadGIFImageForName:(NSString *)name;

/**
 从NSData里加载GIF图片
 
 @param data 图片数据
 @return UIImage
 */
+ (UIImage *)cl_loadGIFImageWithData:(NSData *)data;

/**
 缩放指定比例的图片

 @param size 指定比例
 @return UIImage
 */
- (UIImage *)cl_animatedImageByScalingAndCroppingToSize:(CGSize)size;

/**
 输入一张图片, 返回一张带高斯模糊的图片
 
 @param blur 模糊值
 @return UIImage
 */
- (UIImage *)cl_blurImageWithBlur:(CGFloat)blur;

/**
 给图片增加圆角

 @param radius 半径
 @return UIImage
 */
- (UIImage *)cl_cornerImageWithRadius:(CGFloat)radius;

/**
 给图片增加圆角,边框, 边框的颜色.

 @param radius 半径
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @return UIImage
 */
- (UIImage *)cl_cornerImageWithRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;

/**
 创建一个二维码
 
 @param string 二维码的内容
 @return UIImage
 */
- (UIImage *)cl_createQRCodeImageWithString:(NSString *)string;

/**
 创建一个二维码, 且可以添加中间的Logo图
 
 @param string 二维码内容
 @param logoName logo图 default size is 150 * 150
 @return UIImage
 */
- (UIImage *)cl_createQRCodeImageWithString:(NSString *)string
                                       logo:(NSString *)logoName;

/**
 创建一个条形码
 
 @param string 条形码内容, 只能输入ASCII字符
 @return UIImage
 */
- (UIImage *)cl_create128BarcodeImageWithString:(NSString *)string;

/**
 创建一个条形码, 并且可以设置条形码与UIImageView两边的间距
 
 @param string 条形码内容, 只能输入ASCII字符
 @param space 与UIImageView两边的距离
 @return UIImage
 */
- (UIImage *)cl_create128BarcodeImageWithString:(NSString *)string
                                          space:(CGFloat)space;

/**
 从指定的Bundle包里获取对应的图片

 @param bundle 资源包
 @param imageName 图片名
 @return UIImage
 */
+ (UIImage *)cl_getImageWithBundleName:(NSString *)bundle
                             imageName:(NSString *)imageName;

/**
 异步绘制图片

 @param size 尺寸
 @param fillColor 填充的颜色
 @param opaque 是否是透明
 @param completion 回调
 */
- (void)cl_asyncCornerImageWithSize:(CGSize)size
                          fillColor:(UIColor *)fillColor
                             opaque:(BOOL)opaque
                         completion:(void (^)(UIImage *))completion;

- (void)cl_asyncCornerImageWithSize:(CGSize)size
                         completion:(void (^)(UIImage *))completion;

- (void)cl_asyncCornerImageWithSize:(CGSize)size
                        borderWidth:(CGFloat)borderWidth
                        borderColor:(UIColor *)borderColor
                         completion:(void (^)(UIImage *))completion;

- (void)cl_asyncCornerImageWithSize:(CGSize)size
                            corners:(UIRectCorner)corners
                        borderWidth:(CGFloat)borderWidth
                        borderColor:(UIColor *)borderColor
                     borderLineJoin:(CGLineJoin)borderLineJoin
                         completion:(void (^)(UIImage *))completion;
@end
