//
//  UIButton+CLButton.h
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIButton (CLButton)

/**
 设置Button的点击区域
 */
@property (nonatomic, assign) UIEdgeInsets cl_clickAreaEdgeInsets;

@end
NS_ASSUME_NONNULL_END
