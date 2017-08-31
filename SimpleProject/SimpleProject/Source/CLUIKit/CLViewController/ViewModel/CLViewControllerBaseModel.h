//
//  CLViewControllerBaseModel.h
//  SimpleProject
//
//  Created by Cain on 2017/8/29.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLViewController.h"

@interface CLViewControllerBaseModel : NSObject

@property (nonatomic, weak, readonly) CLViewController *cl_viewController;

- (instancetype)initViewControllerViewModelWithController:(CLViewController *)controller;

@end
