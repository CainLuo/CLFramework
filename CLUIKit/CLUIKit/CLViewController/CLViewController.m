//
//  CLViewController.m
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLViewController.h"

@interface CLViewController ()

@end

@implementation CLViewController

- (instancetype)initCLViewControllerWith:(CLViewControllerStyle)style {
    
    self = [super init];
    
    if (self) {
        
        if (style == CLChildViewController) {
            
            self.hidesBottomBarWhenPushed = YES;
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.opaque = YES;
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
