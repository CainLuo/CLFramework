//
//  SimpleImageViewController.m
//  SimpleProject
//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleImageViewController.h"

@interface SimpleImageViewController ()

@property (nonatomic, strong) UIImageView *simpleImageView;

@end

@implementation SimpleImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateNormal];
    [button setTitle:@"截取"
            forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(buttonAction)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    _simpleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                     64,
                                                                     [UIScreen cl_getScreenWidth],
                                                                     200)];
    _simpleImageView.backgroundColor = [UIColor whiteColor];
    _simpleImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:_simpleImageView];
}

- (void)buttonAction {
    
    UIImage *image = [[UIImage alloc] init];
    
    _simpleImageView.image = [image getImageForScreen];
}

@end
