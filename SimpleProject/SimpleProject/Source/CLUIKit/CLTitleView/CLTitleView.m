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

#define BUTTON_WIDTH [UIScreen cl_fitScreen:96]
#define BUTTON_HEIGHT [UIScreen cl_fitScreen:88]

#define LABEL_HEIGHT [UIScreen cl_fitScreen:88]

#import "CLTitleView.h"
#import "UIScreen+CLScreen.h"

@interface CLTitleView ()

@property (nonatomic, strong, readwrite) UILabel *cl_titleLabel;

@property (nonatomic, strong, readwrite) UIButton *cl_leftButton;
@property (nonatomic, strong, readwrite) UIButton *cl_rightButton;

@end

@implementation CLTitleView

#pragma mark - Init Method
- (instancetype)initCLTitleViewWithType:(CLTitleViewType)titleViewType {
    
    self = [super init];
    
    if (self) {
        
        self.cl_titleViewType = titleViewType;
    }
    
    return self;
}

- (instancetype)initCLTitleViewWithWithFrame:(CGRect)frame
                                        type:(CLTitleViewType)titleViewType {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.cl_titleViewType = titleViewType;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.cl_titleViewType = CLTitleViewTitleType;
    }
    
    return self;
}

#pragma mark - Set CLTitleView Type
- (void)setCl_titleViewType:(CLTitleViewType)cl_titleViewType {
    
    switch (cl_titleViewType) {
        case CLTitleViewTitleType:
            
            break;
        case CLTitleViewCloseType:

            [self cl_needLeftButton];

            [self cl_changeLeftButtonWithImageName:@"close"
                                     highImageName:@"closeHigh"];
            
            break;
        case CLTitleViewBackType:
            
            [self cl_needLeftButton];
            
            break;
        case CLTitleViewShareType:
            
            [self cl_needLeftButton];
            [self cl_needRightButton];
            
            break;
        case CLTitleViewRightAloneType:
            
            [self cl_needRightButton];
            
            [self cl_changeRightButtonWithImageName:@"settingImage"
                                      highImageName:@"settingImageHigh"];
            
            break;
        default:
            break;
    }
}

#pragma mark - Title Label
- (UILabel *)cl_titleLabel {
    
    if (!_cl_titleLabel) {
        
        _cl_titleLabel = [[UILabel alloc] init];
        _cl_titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [_cl_titleLabel sizeToFit];
    }
    
    return _cl_titleLabel;
}

- (void)setCl_titleString:(NSString *)cl_titleString {
    
    self.cl_titleLabel.text = cl_titleString;
    
    [self addSubview:self.cl_titleLabel];
    
    self.cl_titleLabel.frame = CGRectMake(BUTTON_WIDTH,
                                          [UIScreen cl_fitScreen:40],
                                          [UIScreen cl_getScreenWidth] - (BUTTON_WIDTH * 2),
                                          LABEL_HEIGHT);
}

- (void)setCl_titleColor:(UIColor *)cl_titleColor {
    
    self.cl_titleLabel.textColor = cl_titleColor;
}

- (void)setCl_titleFont:(CGFloat)cl_titleFont {
    self.cl_titleLabel.font = [UIFont systemFontOfSize:cl_titleFont];
}

- (void)setCl_textAlignment:(NSTextAlignment)cl_textAlignment {
    self.cl_titleLabel.textAlignment = cl_textAlignment;
}

#pragma mark - Left Button
- (UIButton *)cl_leftButton {
    
    if (!_cl_leftButton) {
        
        _cl_leftButton = [[UIButton alloc] init];
        
        [_cl_leftButton setImage:[self cl_setButtonImageWithString:@"backButtonImage"]
                        forState:UIControlStateNormal];
        [_cl_leftButton setImage:[self cl_setButtonImageWithString:@"backButtonImageHigh"]
                        forState:UIControlStateHighlighted];
        [_cl_leftButton addTarget:self
                           action:@selector(leftButtonAction:)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cl_leftButton;
}

- (void)cl_needLeftButton {
    
    [self addSubview:self.cl_leftButton];
    
    self.cl_leftButton.frame = CGRectMake(0,
                                          [UIScreen cl_fitScreen:40],
                                          BUTTON_WIDTH,
                                          BUTTON_HEIGHT);
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
        
        [_cl_rightButton setImage:[self cl_setButtonImageWithString:@"shareButtonImage"]
                         forState:UIControlStateNormal];
        [_cl_rightButton setImage:[self cl_setButtonImageWithString:@"shareButtonImageHigh"]
                         forState:UIControlStateHighlighted];
        [_cl_rightButton addTarget:self
                            action:@selector(rightButtonAction:)
                  forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cl_rightButton;
}

- (void)cl_needRightButton {

    [self addSubview:self.cl_rightButton];
    
    self.cl_rightButton.frame = CGRectMake([UIScreen cl_getScreenWidth] - BUTTON_WIDTH,
                                           [UIScreen cl_fitScreen:40],
                                           BUTTON_WIDTH,
                                           BUTTON_HEIGHT);
}

- (void)rightButtonAction:(UIButton *)sender {
    
    if (self.cl_titleViewRightButtonBlock) {
        
        self.cl_titleViewRightButtonBlock(sender);
    }
}

#pragma mark - Change Buttons Image
- (void)cl_changeLeftButtonWithImageName:(NSString *)imageName
                           highImageName:(NSString *)highImageName {
    
    UIImage *imageNormal = [self cl_setButtonImageWithString:imageName] ? [self cl_setButtonImageWithString:imageName] : [UIImage imageNamed:imageName];
    UIImage *imageHigh = [self cl_setButtonImageWithString:highImageName] ? [self cl_setButtonImageWithString:highImageName] : [UIImage imageNamed:highImageName];
    
    [self.cl_leftButton setImage:imageNormal
                        forState:UIControlStateNormal];
    [self.cl_leftButton setImage:imageHigh
                        forState:UIControlStateHighlighted];
}

- (void)cl_changeRightButtonWithImageName:(NSString *)imageName
                            highImageName:(NSString *)highImageName {

    UIImage *imageNormal = [self cl_setButtonImageWithString:imageName] ? [self cl_setButtonImageWithString:imageName] : [UIImage imageNamed:imageName];
    UIImage *imageHigh = [self cl_setButtonImageWithString:highImageName] ? [self cl_setButtonImageWithString:highImageName] : [UIImage imageNamed:highImageName];

    [self.cl_rightButton setImage:imageNormal
                         forState:UIControlStateNormal];
    [self.cl_rightButton setImage:imageHigh
                         forState:UIControlStateHighlighted];
}

#pragma mark - Set Buttons Image
- (UIImage *)cl_setButtonImageWithString:(NSString *)string {
    
    NSBundle *mainBundle = [NSBundle bundleForClass:[self class]];
    
    NSBundle *resourcesBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:@"CLTitleView"
                                                                              ofType:@"bundle"]];
    
    if (!resourcesBundle) {
        
        resourcesBundle = mainBundle;
    }
    
    UIImage *image = [UIImage imageNamed:string
                                inBundle:resourcesBundle
           compatibleWithTraitCollection:nil];

    return image;
}

@end
