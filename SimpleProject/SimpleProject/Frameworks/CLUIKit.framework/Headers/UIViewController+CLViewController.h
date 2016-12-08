//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIViewController+CLViewController.h
//  SimpleProject
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CLViewController)

/**
 设置NavigationBar的Translucent, 默认为YES, 如果为NO, 那么视图的Top会紧挨UINavigationBar的底部, 但前提automaticallyAdjustsScrollViewInsets要为YES

 @param bools BOOL
 */
- (void)cl_setNavigationBarTranslucentWithBOOL:(BOOL)bools;

/**
 设置TabBar的Translucent, 默认为YES, 如果为NO, 那么视图的Bottom会和屏幕底部紧挨, 但前提automaticallyAdjustsScrollViewInsets要为YES

 @param bools BOOL
 */
- (void)cl_setTabBarTranslucentWithBOOL:(BOOL)bools;

@end
