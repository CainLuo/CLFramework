//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLToolBarListView.m
//
//  Created by Cain on 22/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "CLToolBarListView.h"

#define SELECTED_LINE_LAYER_HEIGHT 3

@interface CLToolBarListView()

@property (nonatomic, strong) CALayer  *bottomLineLayer;
@property (nonatomic, strong) CALayer  *selectedLineLayer;
@property (nonatomic, strong) UIButton *currentButton;

@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation CLToolBarListView

#pragma mark - 初始化ToolBar
- (instancetype)initToolBarWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        _deselectColor   = [UIColor blackColor];
        _selectedColor   = [UIColor redColor];
        _bottomLineColor = [UIColor grayColor];
        _buttonSpacing   = 10.f;
        _textFont        = 16;
        _toolBarStyle    = CLToolBarNormalStyle;
        _titleAdjustsFontSizeToFitWidth = NO;
        
        // CALToolBarSeparationStyle
        _separationColor = [UIColor grayColor];
        _separationWidth = 1;
        
        [self.layer addSublayer:self.bottomLineLayer];
        [self.layer addSublayer:self.selectedLineLayer];

        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

#pragma mark - 设置ToolBar显示的样式
- (void)setToolBarStyle:(CLToolBarStyle)toolBarStyle {
    _toolBarStyle = toolBarStyle;
}

#pragma mark - 设置未选中的按钮颜色
- (void)setDeselectColor:(UIColor *)deselectColor {
    _deselectColor = deselectColor;
}

#pragma mark - 设置选中的按钮颜色
- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
}

#pragma mark - 设置ToolBar的背景颜色
- (void)setBarBakcgroundColor:(UIColor *)barBakcgroundColor {
    self.backgroundColor = barBakcgroundColor;
}

#pragma mark - 设置底部线条的颜色
- (void)setBottomLineColor:(UIColor *)bottomLineColor {
    
    _bottomLineColor = bottomLineColor;
    
    _bottomLineLayer.backgroundColor = bottomLineColor.CGColor;
}

#pragma mark - 设置选中提示条的颜色
- (void)setSelectedLineColor:(UIColor *)selectedLineColor {
    
    _selectedLineColor = selectedLineColor;
    
    _selectedLineLayer.backgroundColor = selectedLineColor.CGColor;
}

#pragma mark - 设置按钮文字大小
- (void)setTextFont:(NSInteger)textFont {
    _textFont = textFont;
}

#pragma mark - 设置标题文字是否自动缩小
- (void)setTitleAdjustsFontSizeToFitWidth:(BOOL)titleAdjustsFontSizeToFitWidth {
    _titleAdjustsFontSizeToFitWidth = titleAdjustsFontSizeToFitWidth;
}

#pragma mark - 设置按钮之间的间距
- (void)setButtonSpacing:(CGFloat)buttonSpacing {
    _buttonSpacing = buttonSpacing;
}

#pragma mark - 是否需要底部线
- (void)setIsNeedLine:(BOOL)isNeedLine {
    _isNeedLine = isNeedLine;
}

#pragma mark - 是否需要选中提示线
- (void)setIsNeedSelectedLine:(BOOL)isNeedSelectedLine {
    _isNeedSelectedLine = isNeedSelectedLine;
}

#pragma mark - 获取当前点中的Button
- (NSInteger)currentIndex {
    return _currentIndex;
}

#pragma mark - 默认选中指定的按钮
- (void)didSelectedButton:(NSInteger)index {
    
    if (self.buttonArray.count > 0) {
        
        self.currentButton.selected = NO;

        UIButton *selecteButton = self.buttonArray[index];
        
        self.currentIndex = index;
        
        self.currentButton = selecteButton;
        
        self.currentButton.selected = YES;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            self.selectedLineLayer.frame = CGRectMake(selecteButton.frame.origin.x,
                                                      self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                      selecteButton.frame.size.width,
                                                      SELECTED_LINE_LAYER_HEIGHT);
        }];
    }
}

#pragma mark - 刷新整个BarList
- (void)reloadData {
    
    NSAssert(self.titleArray.count, @"你所传入的数组为空");

    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:[UIButton class]]) {
            
            [subView removeFromSuperview];
        }
        
        if ([subView isKindOfClass:[UIView class]]) {
            
            [subView removeFromSuperview];
        }
    }
    
    UIView *layerBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    layerBackgroundView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];

    [self addSubview:layerBackgroundView];
    
    for (NSInteger i = 0; i < self.titleArray.count; i++) {
        
        CGFloat buttonWidth = self.frame.size.width / _titleArray.count;
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat buttonX = i == 0 ? i * buttonWidth + (_buttonSpacing / 2) : i * buttonWidth + _buttonSpacing - (_buttonSpacing / 2);
        
        titleButton.frame = CGRectMake(buttonX,
                                       0,
                                       buttonWidth - _buttonSpacing,
                                       self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT);
        titleButton.tag   = i;
        
        titleButton.titleLabel.font = [UIFont systemFontOfSize:self.textFont];
        titleButton.titleLabel.adjustsFontSizeToFitWidth = _titleAdjustsFontSizeToFitWidth;
        
        titleButton.backgroundColor = [UIColor clearColor];
        
        [titleButton setTintColor:[UIColor clearColor]];
        
        [titleButton setTitle:_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitle:_titleArray[i] forState:UIControlStateSelected];
        
        [titleButton setTitleColor:_deselectColor forState:UIControlStateNormal];
        [titleButton setTitleColor:_selectedColor forState:UIControlStateSelected];
        
        [titleButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            titleButton.selected = YES;
            self.currentButton = titleButton;
        }
        
        [self addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        
        if (_toolBarStyle == CLToolBarSeparationStyle) {
            
            CALayer *separationLayer = [CALayer layer];
            
            separationLayer.backgroundColor = _separationColor.CGColor;
            
            CGFloat separationLayerH = titleButton.frame.size.height - 15;

            separationLayer.frame = CGRectMake(i * buttonWidth - 0.5, (titleButton.frame.size.height - separationLayerH) / 2, _separationWidth, separationLayerH);
            
            if (i != 0) {
                [layerBackgroundView.layer addSublayer:separationLayer];
            }
        }
    }
    
    _selectedLineLayer.frame = CGRectMake(_buttonSpacing / 2,
                                          self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                          self.frame.size.width / self.titleArray.count - _buttonSpacing,
                                          SELECTED_LINE_LAYER_HEIGHT);
}

- (void)buttonAction:(UIButton *)sender {
    
    if (self.clToolBarSelectedBlock) {
        
        self.currentButton.selected = NO;
        
        self.currentButton = sender;
        self.currentIndex  = sender.tag;
        
        self.currentButton.selected = YES;

        self.clToolBarSelectedBlock(sender.tag);

        [self selectedLineLayerAnimaction];
    }
}

#pragma mark - Button Width Calculation
//- (CGFloat)caculateButtonWidthWithTitleArray:(NSArray *)titleArray {
//    
//    NSInteger titleCount = (NSInteger)titleArray.count;
//    
//    NSString *totalStr = @"";
//    for (NSInteger i = 0; i < titleCount; i++) {
//        
//        if ([titleArray[i] isKindOfClass:[NSString class]] &&
//            [titleArray[i] length]) {
//            
//            totalStr = [totalStr stringByAppendingString:titleArray[i]];
//        }
//    }
//    
//    CGFloat totalWidth = (CGFloat)(NSInteger)[totalStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.textFont]} context:nil].size.width + titleCount / 2;
//    
//    return totalWidth;
//}

#pragma mark - Init Bottom Line Layer
- (CALayer *)bottomLineLayer {
    
    if (!_bottomLineLayer) {
        
        _bottomLineLayer = [CALayer layer];
        
        _bottomLineLayer.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
        
        _bottomLineLayer.backgroundColor = [UIColor grayColor].CGColor;
    }
    
    return _bottomLineLayer;
}

#pragma mark - Init Selected Line Layer
- (CALayer *)selectedLineLayer {
    
    if (!_selectedLineLayer) {
        
        _selectedLineLayer = [CALayer layer];
        
        _selectedLineLayer.frame = CGRectMake(_buttonSpacing / 2,
                                              self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                              self.frame.size.width / _titleArray.count - _buttonSpacing,
                                              SELECTED_LINE_LAYER_HEIGHT);
        
        _selectedLineLayer.backgroundColor = [UIColor blueColor].CGColor;
    }
    
    return _selectedLineLayer;
}

- (void)selectedLineLayerAnimaction {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.selectedLineLayer.frame = CGRectMake(self.currentButton.frame.origin.x,
                                                  self.frame.size.height - SELECTED_LINE_LAYER_HEIGHT,
                                                  self.frame.size.width / _titleArray.count - _buttonSpacing,
                                                  SELECTED_LINE_LAYER_HEIGHT);
    }];
}

#pragma mark - Init Button Array
- (NSMutableArray *)buttonArray {
    
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    
    return _buttonArray;
}

#pragma mark -  CALToolBarSeparationStyle
#pragma mark - 设置Separation Color
- (void)setSeparationColor:(UIColor *)separationColor {
    _separationColor = separationColor;
}

#pragma mark - 设置Separation Width
- (void)setSeparationWidth:(CGFloat)separationWidth {
    _separationWidth = separationWidth;
}

@end
