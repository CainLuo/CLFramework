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
    
    [self.view addSubview:imageView];
}

@end
