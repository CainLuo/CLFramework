//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTitleView.m
//  SimpleProject
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLTitleView.h"
#import "Masonry.h"
#import "UIScreen+CLScreen.h"

@interface CLTitleView ()

@property (nonatomic, strong) UILabel *cl_titleLabel;

@property (nonatomic, strong, readwrite) UIButton *cl_leftButton;
@property (nonatomic, strong, readwrite) UIButton *cl_rightButton;

@end

@implementation CLTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self cl_addConstraintsWithSuperView];
    }
    
    return self;
}

#pragma mark - Title Label
- (UILabel *)cl_titleLabel {
    
    if (!_cl_titleLabel) {
        
        _cl_titleLabel = [[UILabel alloc] init];
     }
    
    return _cl_titleLabel;
}

- (void)setCl_titleString:(NSString *)cl_titleString {
    
    self.cl_titleLabel.text = cl_titleString;
}

- (void)setCl_textAlignment:(NSTextAlignment)cl_textAlignment {
    self.cl_titleLabel.textAlignment = cl_textAlignment;
}

#pragma mark - Left Button
- (UIButton *)cl_leftButton {
    
    if (!_cl_leftButton) {
        
        _cl_leftButton = [[UIButton alloc] init];
        
        [_cl_leftButton addTarget:self
                           action:@selector(leftButtonAction:)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cl_leftButton;
}

- (void)cl_needLeftButton {
    
    [self addSubview:self.cl_leftButton];
    
    [self.cl_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.left.bottom;
        make.height.width.mas_equalTo([UIScreen cl_fitScreen:88]);
    }];
}

- (void)leftButtonAction:(UIButton *)sender {
    
    if (self.cl_titleViewLeftButtonBlock) {
        self.cl_titleViewLeftButtonBlock(sender);
    }
}

#pragma mark - Right Button
- (UIButton *)cl_rightButton {
    
    if (!_cl_rightButton) {
        
        _cl_rightButton = [[UIButton alloc] init];
        
        [_cl_rightButton addTarget:self
                            action:@selector(rightButtonAction:)
                  forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cl_rightButton;
}

- (void)cl_needRightButton {
    [self addSubview:self.cl_rightButton];
    
    [self.cl_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.left.bottom;
        make.height.width.mas_equalTo([UIScreen cl_fitScreen:88]);
    }];
}

- (void)rightButtonAction:(UIButton *)sender {
    
    if (self.cl_titleViewRightButtonBlock) {
        self.cl_titleViewRightButtonBlock(sender);
    }
}

#pragma mark - Add Constraints With Super View
- (void)cl_addConstraintsWithSuperView {
    
    [self addSubview:self.cl_titleLabel];
    
    [self.cl_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.left.right.bottom;
        make.top.mas_equalTo([UIScreen cl_fitScreen:40]);
    }];
}

@end
