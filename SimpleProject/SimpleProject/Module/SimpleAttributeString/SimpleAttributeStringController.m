//
//  SimpleAttributeStringController.m
//  SimpleProject
//
//  Created by Cain Luo on 2017/12/3.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleAttributeStringController.h"

@interface SimpleAttributeStringController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation SimpleAttributeStringController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.label];
    
    self.label.attributedText = [NSAttributedString cl_attributeStringWithString:@"这是一条乱七八糟的信息"
                                                                           color:[UIColor redColor]
                                                                           range:NSMakeRange(3, 2)];

    self.label.attributedText = [NSAttributedString cl_attributeStringWithAttributedString:self.label.attributedText
                                                                                      font:[UIFont systemFontOfSize:30]
                                                                                     range:NSMakeRange(3, 3)];

//    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        (void)make.center.left.right;
//    }];
    
    NSLog(@"%f", [self.label.attributedText cl_attributedStringHeightWithContainWidth:[UIScreen cl_getScreenWidth]]);
    
    CGSize stringSize = [NSString cl_measureSinglelineStringSize:self.label.text
                                                            font:self.label.font];
    CGFloat stringWidth = [NSString cl_measureSinglelineStringWidth:self.label.text
                                                               font:self.label.font];
    CGFloat stringHeight = [NSString cl_measureMutilineStringHeight:self.label.text
                                                               font:self.label.font
                                                              width:stringWidth];
    
    self.label.frame = CGRectMake(0, 0, stringWidth + 39, stringHeight);

    NSLog(@"Size: %f - %f Width:%f, Height:%f", stringSize.width, stringSize.height, stringWidth, stringHeight);
    NSLog(@"Label Width: %f, Label Height: %f", self.label.frame.size.width, self.label.frame.size.height);
    
}

- (UILabel *)label {
    
    CL_GET_METHOD_RETURN_OBJC(_label);
    
    _label = [[UILabel alloc] init];
    
    _label.text = @"这是一条乱七八糟的信息";
    
    return _label;
}

@end
