//
//  SimpleDrawCircleController.m
//  SimpleProject
//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleDrawCircleController.h"

@interface SimpleDrawCircleController ()

@end

@implementation SimpleDrawCircleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor grayColor];
    
    UIImageView *simpleProjectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    simpleProjectImageView.image = [[UIImage imageNamed:@"1"] cl_cornerImageWithRadius:100 / 2];
    
    [self.view addSubview:simpleProjectImageView];
}

@end
