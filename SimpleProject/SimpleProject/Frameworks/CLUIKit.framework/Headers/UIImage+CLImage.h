//
//  UIImage+CLImage.h
//  CLUIKit
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CLImage)

- (UIImage *)getImageForScreen;
- (UIImage *)getImageForView:(UIView *)view;

@end
