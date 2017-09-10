//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIViewController+CLViewController.h
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

/**
 呼叫手机号

 @param phoneNumber 输入对应的手机号
 @param title 标题语
 */
- (void)cl_callPhoneWithPhoneNumber:(NSString *)phoneNumber
                            message:(NSString *)message
                             titile:(NSString *)title;

/**
 调用AlertController, 默认UIAlertControllerStyleAlert样式

 @param title 标题语
 @param message 提示信息
 */
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                buttonTitle:(NSString *)buttonTitle;
/**
 调用AlertController

 @param title 标题语
 @param message 提示信息
 @param actions UIAlertAction数组
 @param preferredStyle UIAlertControllerStyle
 */
- (void)cl_showAlertViewControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                    actions:(NSArray<UIAlertAction *> *) actions
                             preferredStyle:(UIAlertControllerStyle)preferredStyle;

@property (nonatomic, strong) UIAlertController *cl_alertController;

@end
