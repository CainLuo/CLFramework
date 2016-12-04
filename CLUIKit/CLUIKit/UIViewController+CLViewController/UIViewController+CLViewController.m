//
//  UIViewController+CLViewController.m
//  SimpleProject
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIViewController+CLViewController.h"

@implementation UIViewController (CLViewController)

- (void)cl_setNavigationBarTranslucentWithBOOL:(BOOL)bools {
    self.navigationController.navigationBar.translucent = bools;
}

- (void)cl_setTabBarTranslucentWithBOOL:(BOOL)bools {
    self.tabBarController.tabBar.translucent = bools;
}

@end
