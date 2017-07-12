//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewDelegate.m
//  SimpleProject
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewDelegate.h"

@interface CLCollectionViewDelegate ()

@property (nonatomic, strong, readwrite) CLCollectionViewBaseModel *cl_collectionViewBaseModel;

@end

@implementation CLCollectionViewDelegate

- (instancetype)initCollectionViewDelegateWithViewModel:(CLCollectionViewBaseModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        self.cl_collectionViewBaseModel = viewModel;
    }
    
    return self;
}

@end
