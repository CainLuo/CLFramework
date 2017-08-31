//
//  CLViewControllerBaseModel.m
//  SimpleProject
//
//  Created by Cain on 2017/8/29.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLViewControllerBaseModel.h"

@interface CLViewControllerBaseModel ()

@property (nonatomic, weak, readwrite) CLViewController *cl_viewController;

@end

@implementation CLViewControllerBaseModel

- (instancetype)initViewControllerViewModelWithController:(CLViewController *)controller {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewController = controller;
    }
    
    return self;
}

@end
