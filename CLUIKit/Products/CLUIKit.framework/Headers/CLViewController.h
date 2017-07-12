//
//  CLViewController.h
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, CLViewControllerStyle) {
    
    CLMainViewController = 0,
    CLChildViewController
};

@interface CLViewController : UIViewController

- (instancetype)initCLViewControllerWith:(CLViewControllerStyle)style;

@end
NS_ASSUME_NONNULL_END
