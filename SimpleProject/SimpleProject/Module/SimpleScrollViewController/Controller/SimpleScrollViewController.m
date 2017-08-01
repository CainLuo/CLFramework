//
//  SimpleScrollViewController.m

//
//  Created by Cain on 2017/7/25.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleScrollViewController.h"

@interface SimpleScrollViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *baseView;

@end

@implementation SimpleScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addViews];
}

- (UIScrollView *)scrollView {
    
    CL_GET_METHOD_RETURN_OBJC(_scrollView);
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor redColor];
    
    _scrollView.contentSize = CGSizeMake([UIScreen cl_getScreenWidth],
                                         [UIScreen cl_getScreenHeight]);

    return _scrollView;
}

- (UIView *)baseView {
    
    CL_GET_METHOD_RETURN_OBJC(_baseView);
    
    _baseView = [[UIView alloc] init];
    
    _baseView.backgroundColor = [UIColor greenColor];
    
    return _baseView;
}

- (void)addViews {
    
    UIScrollView *verticalScrollView = [[UIScrollView alloc] init];
    
    verticalScrollView.backgroundColor = [UIColor greenColor];
    
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:verticalScrollView];
    
    [verticalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.bottom.and.right.mas_equalTo(-10.0);
        make.height.mas_equalTo(500);
    }];
    
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *verticalContainerView = [[UIView alloc] init];
    
    [verticalScrollView addSubview:verticalContainerView];
    
    [verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(verticalScrollView).with.insets(UIEdgeInsetsZero);
        make.width.equalTo(verticalScrollView);
    }];
    
    //过渡视图添加子视图
    UIView *lastView =nil;
    
    for (NSInteger index =0; index <10; index++) {
        
        UILabel *label = [[UILabel alloc]init];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.backgroundColor = [UIColor colorWithHue:(arc4random() %256 / 256.0)
                                          saturation:(arc4random() %128 /256.0) +0.5
                                          brightness:(arc4random() %128 /256.0) +0.5
                                               alpha:1];
        
        label.text = [NSString stringWithFormat:@"第 %ld个视图", index];
        
        //添加到父视图，并设置过渡视图中子视图的约束
        [verticalContainerView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.and.right.equalTo(verticalContainerView);
            make.height.mas_equalTo(verticalScrollView.mas_height);
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
                
            } else {
                
                make.top.mas_equalTo(0);
            }
        }];
        
        lastView = label;
    }
    
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

@end
