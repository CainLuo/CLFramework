//
//  CLTitleView.h
//  SimpleProject
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLTitleView : UIView

#pragma mark - Text Alignment
@property(nonatomic) NSTextAlignment cl_textAlignment;

#pragma mark - Title String
@property (nonatomic, copy) NSString *cl_titleString;

@property (nonatomic, strong, readonly) UIButton *cl_leftButton;
@property (nonatomic, strong, readonly) UIButton *cl_rightButton;

#pragma mark - Buttons
- (void)cl_needLeftButton;
- (void)cl_needRightButton;

#pragma mark - Buttons Action
@property (nonatomic, copy) void(^cl_titleViewLeftButtonBlock)(UIButton *sender);
@property (nonatomic, copy) void(^cl_titleViewRightButtonBlock)(UIButton *sender);

@end
