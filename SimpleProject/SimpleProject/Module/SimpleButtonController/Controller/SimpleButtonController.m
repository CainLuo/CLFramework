//
//  SimpleButtonController.m

//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleButtonController.h"

@interface SimpleButtonController ()

@end

@implementation SimpleButtonController

- (void)dealloc {
    
    NSLog(@"释放了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    
    self.view.backgroundColor = [UIColor lightGrayColor];

    NSArray *titleArray = @[@"标题一", @"标题二", @"标题三", @"标题四", @"标题五"];
    
    CLToolBarListView *toolBarList = [[CLToolBarListView alloc] initToolBarWithFrame:CGRectMake(0,
                                                                                                250,
                                                                                                self.view.frame.size.width,
                                                                                                40)];
    toolBarList.cl_titleArray = titleArray;
    toolBarList.cl_barBakcgroundColor = [UIColor greenColor];
    toolBarList.cl_selectedLineColor  = [UIColor redColor];
    toolBarList.cl_bottomLineColor    = [UIColor blueColor];
    toolBarList.cl_toolBarStyle       = CLToolBarSeparationStyle;
    toolBarList.cl_separationColor    = [UIColor grayColor];
    
    [toolBarList cl_reloadData];
    [toolBarList cl_didSelectedButton:3];
    
    NSLog(@"currentIndex: %zd", toolBarList.currentIndex);
    
    [toolBarList setCl_toolBarSelectedBlock:^(NSInteger index) {
        NSLog(@"index: %zd", index);
    }];
    
    [self.view addSubview:toolBarList];
    
    [self cl_getCodeButton];
    [self cl_ButtonClike];
    [self cl_getBaseBottom];
}

- (void)cl_getBaseBottom {
    
    CLButton *buttonOne = [[CLButton alloc] init];
    
    buttonOne.cl_imageSize        = CGSizeMake(20, 20);
    buttonOne.cl_imageSpacing     = 50;
    buttonOne.cl_buttomImageStyle = CLButtonImageTopStyle;
    
    [buttonOne setImage:[UIImage imageNamed:@"1"]
               forState:UIControlStateNormal];
    [buttonOne setTitle:@"获取验证码"
               forState:UIControlStateNormal];

    [self.view addSubview:buttonOne];
    
    [buttonOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self.view).offset(100);
        make.height.width.mas_equalTo(150);
    }];
}

#pragma mark - 获取验证码的按钮
- (void)cl_getCodeButton {
    
    UIButton *button = [[UIButton alloc] init];
    
//    button.backgroundColor = [UIColor blueColor];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonNormalImage"]
                      forState:UIControlStateNormal];
    
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
    
//    [sender cl_startButtonWithTime:10];
    [sender cl_startButtonWithTime:10
                       normalImage:[UIImage imageNamed:@"buttonNormalImage"]
                      disableImage:[UIImage imageNamed:@"buttonDisableImage"]];
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
