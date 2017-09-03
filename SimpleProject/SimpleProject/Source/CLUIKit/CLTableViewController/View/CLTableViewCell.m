//
//  CLTableViewCell.m
//  SimpleProject
//
//  Created by Cain on 2017/9/3.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLTableViewCell.h"
#import "UIImage+CLImage.h"

@interface CLTableViewCell ()

@property (nonatomic, strong) UIImageView *cl_lineImageView;

@end

@implementation CLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self cl_addConstraintsWithSuperView];
    }
    
    return self;
}

- (UIImageView *)cl_lineImageView {
    
    if (!_cl_lineImageView) {
        
        _cl_lineImageView = [[UIImageView alloc] init];
        
        _cl_lineImageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        _cl_lineImageView.image = [UIImage cl_getImageWithBundleName:@"CLTableViewCell"
                                                           imageName:@"line"];
    }
    
    return _cl_lineImageView;
}

- (void)cl_addConstraintsWithSuperView {
    
    [self addSubview:self.cl_lineImageView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0];

    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:0];

    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1
                                                               constant:1];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.cl_lineImageView
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeHeight
                                                             multiplier:1
                                                               constant:1];
    
    [self addConstraint:left];
    [self addConstraint:right];
    [self addConstraint:bottom];
    [self addConstraint:height];
}

@end
