//
//  UIButton+CLButton.m
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "UIButton+CLButton.h"
#import <objc/runtime.h>

@implementation UIButton (CLButton)

- (void)setCl_clickAreaEdgeInsets:(UIEdgeInsets)cl_clickAreaEdgeInsets {
    
    NSValue *value = [NSValue valueWithUIEdgeInsets:cl_clickAreaEdgeInsets];
    
    objc_setAssociatedObject(self, @selector(cl_clickAreaEdgeInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIEdgeInsets)cl_clickAreaEdgeInsets {
    
    NSValue *value = objc_getAssociatedObject(self, @selector(cl_clickAreaEdgeInsets));
    
    if (value) {
        UIEdgeInsets edgeInset = [value UIEdgeInsetsValue];
        return edgeInset;
    }
    
    return UIEdgeInsetsZero;
}

- (BOOL)pointInside:(CGPoint)point
          withEvent:(UIEvent *)event {
    
    if (UIEdgeInsetsEqualToEdgeInsets(self.cl_clickAreaEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        
        return [super pointInside:point
                        withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.cl_clickAreaEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
