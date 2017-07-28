//
//  SimpleButtonController.m
//  SimpleProject
//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleButtonController.h"

@interface SimpleButtonController ()

@end

@implementation SimpleButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    
    self.view.backgroundColor = [UIColor lightGrayColor];

    [self cl_getCodeButton];
    [self cl_ButtonClike];
}

#pragma mark - 获取验证码的按钮
- (void)cl_getCodeButton {
    
    UIButton *button = [[UIButton alloc] init];
    
    button.backgroundColor = [UIColor blueColor];
    
    [button setTitle:@"获取验证码"
            forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self.view).offset(20);
    }];
}

- (void)buttonAction:(UIButton *)sender {
    
    [sender cl_startButtonWithTime:10];
}

#pragma mark - 扩大按钮的点击区域
- (void)cl_ButtonClike {
    
    UIButton *button = [[UIButton alloc] init];
    
    button.backgroundColor = [UIColor redColor];
    button.cl_clickAreaEdgeInsets = UIEdgeInsetsMake(-30, -30, -30, -30);
    
    [button addTarget:self
               action:@selector(clickbuttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(100);
    }];
}

- (void)clickbuttonAction:(UIButton *)sender {
    
    NSLog(@"点击了按钮");
}

@end
