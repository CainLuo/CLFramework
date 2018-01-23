//
//  NSData+CLData.m
//  CLFoundation
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 Cain. All rights reserved.
//

#import "NSData+CLData.h"

@implementation NSData (CLData)

+ (NSData *)sh_compressOriginalImage:(UIImage *)image
                  compressionQuality:(CGFloat)compressionQuality {
    
    NSData *data = UIImageJPEGRepresentation(image, compressionQuality);
    
    CGFloat dataKBytes = data.length / 1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData   = dataKBytes;
    
    while (dataKBytes > compressionQuality && maxQuality > 0.01f) {
        
        maxQuality = maxQuality - 0.01f;
        
        data = UIImageJPEGRepresentation(image, maxQuality);
        
        dataKBytes = data.length / 1000.0;
        
        if (lastData == dataKBytes) {
            
            break;
            
        } else {
            
            lastData = dataKBytes;
        }
    }
    
    return data;
}

@end
