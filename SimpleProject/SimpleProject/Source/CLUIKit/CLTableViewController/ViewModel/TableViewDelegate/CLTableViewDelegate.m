//
//  CLTableViewDelegate.m
//  SimpleProject
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLTableViewDelegate.h"

@interface CLTableViewDelegate ()

@property (nonatomic, strong, readwrite) CLTableViewBaseModel *cl_viewModel;

@end

@implementation CLTableViewDelegate

- (instancetype)initTableViewDelegateWithViewModel:(CLTableViewBaseModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_viewModel = viewModel;
    }
    
    return self;
}

@end
