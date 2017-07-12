//
//  UIImage+CLImage.m
//  CLUIKit
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import "UIImage+CLImage.h"
#import <ImageIO/ImageIO.h>
#import <Accelerate/Accelerate.h>

@implementation UIImage (CLImage)

/**
 截取指定视图大小的截图
 
 @param view 指定视图
 @return 图片
 */
+ (UIImage *)cl_getImageForView:(UIView *)view {

        UIImage *imageRet = [[UIImage alloc] init];
    
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
        imageRet = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
        return imageRet;
}

/**
 加载指定名称的GIF图片

 @param name 图片名
 @return 图片
 */
+ (UIImage *)cl_loadGIFImageForName:(NSString *)name {
    
    CGFloat scale = [UIScreen mainScreen].scale;
    
    if (scale > 1.0f) {
        
        NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"]
                                                               ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:retinaPath];
        
        if (data) {
            return [UIImage cl_loadGIFImageWithData:data];
        }
        
        NSString *path = [[NSBundle mainBundle] pathForResource:name
                                                         ofType:@"gif"];
        
        data = [NSData dataWithContentsOfFile:path];
        
        if (data) {
            return [UIImage cl_loadGIFImageWithData:data];
        }
        
        return [UIImage imageNamed:name];
        
    } else {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:name
                                                         ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        if (data) {
            return [UIImage cl_loadGIFImageWithData:data];
        }
        
        return [UIImage imageNamed:name];
    }
}


/**
 从NSData里加载GIF图片

 @param data 图片数据
 @return 图片
 */
+ (UIImage *)cl_loadGIFImageWithData:(NSData *)data {
    
    if (!data) {
        return nil;
    }
    
    //获取数据源
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data,
                                                          NULL);
    
    // 获取图片数量(如果传入的是gif图的二进制，那么获取的是图片帧数)
    size_t count = CGImageSourceGetCount(source);
    
    UIImage *animatedImage;
    
    if (count <= 1) {
        animatedImage = [[UIImage alloc] initWithData:data];
        
    } else {
        
        NSMutableArray *images = [NSMutableArray array];
        
        NSTimeInterval duration = 0.0f;
        
        for (size_t i = 0; i < count; i++) {
            
            CGImageRef image = CGImageSourceCreateImageAtIndex(source,
                                                               i,
                                                               NULL);
            
            duration += [self cl_frameDurationAtIndex:i
                                               source:source];
            
            [images addObject:[UIImage imageWithCGImage:image
                                                  scale:[UIScreen mainScreen].scale
                                            orientation:UIImageOrientationUp]];
            
            CGImageRelease(image);
        }
        
        // 如果上面的计算播放时间方法没有成功，就按照下面方法计算
        // 计算一次播放的总时间：每张图播放1/10秒 * 图片总数
        if (!duration) {
            duration = (1.0f / 10.0f) * count;
        }
        
        animatedImage = [UIImage animatedImageWithImages:images
                                                duration:duration];
    }
    
    CFRelease(source);
    
    return animatedImage;
}

/**
 计算GIF图片播放的时间

 @param index 索引
 @param source 图片内容
 @return 计算时间
 */
+ (CGFloat)cl_frameDurationAtIndex:(NSUInteger)index
                            source:(CGImageSourceRef)source {
    
    CGFloat frameDuration = 0.1f;
    
    // 获取这一帧的属性字典
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source,
                                                                           index,
                                                                           nil);
    
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    // 从字典中获取这一帧持续的时间
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    
    if (delayTimeUnclampedProp) {
        
        frameDuration = [delayTimeUnclampedProp floatValue];
        
    } else {
        
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        
        if (delayTimeProp) {
            
            frameDuration = [delayTimeProp floatValue];
        }
    }
    
    // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
    // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
    // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
    // for more information.
    
    if (frameDuration < 0.011f) {
        
        frameDuration = 0.100f;
    }
    
    CFRelease(cfFrameProperties);
    return frameDuration;
}

/**
 缩放指定比例的图片
 
 @param size 指定比例
 @return 图片
 */
- (UIImage *)cl_animatedImageByScalingAndCroppingToSize:(CGSize)size {
    
    if (CGSizeEqualToSize(self.size, size) || CGSizeEqualToSize(size, CGSizeZero)) {
        return self;
    }
    
    CGSize scaledSize = size;
    CGPoint thumbnailPoint = CGPointZero;
    
    CGFloat widthFactor = size.width / self.size.width;
    CGFloat heightFactor = size.height / self.size.height;
    CGFloat scaleFactor = (widthFactor > heightFactor) ? widthFactor : heightFactor;
    
    scaledSize.width = self.size.width * scaleFactor;
    scaledSize.height = self.size.height * scaleFactor;
    
    if (widthFactor > heightFactor) {
        
        thumbnailPoint.y = (size.height - scaledSize.height) * 0.5;
        
    } else if (widthFactor < heightFactor) {
        
        thumbnailPoint.x = (size.width - scaledSize.width) * 0.5;
    }
    
    NSMutableArray *scaledImages = [NSMutableArray array];
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    for (UIImage *image in self.images) {
        
        [image drawInRect:CGRectMake(thumbnailPoint.x,
                                     thumbnailPoint.y,
                                     scaledSize.width,
                                     scaledSize.height)];
        
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        [scaledImages addObject:newImage];
    }
    
    UIGraphicsEndImageContext();
    
    return [UIImage animatedImageWithImages:scaledImages
                                   duration:self.duration];
}

/**
 输入一张图片, 返回一张带高斯模糊的图片

 @param blur 模糊值
 @return 图片
 */
- (UIImage *)cl_blurImageWithBlur:(CGFloat)blur {
    
    NSData *imageData  = UIImageJPEGRepresentation(self, 1); // convert to jpeg
    UIImage *destImage = [UIImage imageWithData:imageData];
    
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 40);
    
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = destImage.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    //create vImage_Buffer with data from CGImageRef
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width    = CGImageGetWidth(img);
    inBuffer.height   = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL) {
        
        NSLog(@"No pixelbuffer");
    }
    
    outBuffer.data     = pixelBuffer;
    outBuffer.width    = CGImageGetWidth(img);
    outBuffer.height   = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    vImage_Buffer outBuffer2;
    
    outBuffer2.data     = pixelBuffer2;
    outBuffer2.width    = CGImageGetWidth(img);
    outBuffer2.height   = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer2,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    error = vImageBoxConvolve_ARGB8888(&outBuffer2,
                                       &inBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}

@end
