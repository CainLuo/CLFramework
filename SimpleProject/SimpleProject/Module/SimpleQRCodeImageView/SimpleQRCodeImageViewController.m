//
//  SimpleQRCodeImageViewController.m
//  SimpleProject
//
//  Created by Cain on 2016/12/8.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleQRCodeImageViewController.h"

@interface SimpleQRCodeImageViewController ()

@end

@implementation SimpleQRCodeImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    imageView.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    
    [imageView createQRCodeImageWithString:@"https://cainrun.github.io"];
    
//    [self.view addSubview:imageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, imageView.sd_height, 50, 50)];
    
    button.backgroundColor = [UIColor redColor];
    button.cl_clickAreaEdgeInsets = UIEdgeInsetsMake(-30, -30, -30, -30);
    
    [button addTarget:self
               action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)sender {
    
    NSLog(@"点击了按钮");
}

@end
