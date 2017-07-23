//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLCollectionViewBaseModel.m
//  SimpleProject
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewBaseModel.h"

@interface CLCollectionViewBaseModel ()

@property (nonatomic, weak, readwrite) CLCollectionViewController *cl_collectionViewController;

@end

@implementation CLCollectionViewBaseModel

- (instancetype)initCollectionViewBaseModelWithController:(CLCollectionViewController *)viewController {
    
    self = [super init];
    
    if (self) {
        self.cl_collectionViewController = viewController;
    }
    
    return self;
}

- (void)cl_collectionViewHTTPRequest {
    
}

- (NSMutableArray *)cl_dataSource {
    
    if (!_cl_dataSource) {
        _cl_dataSource = [NSMutableArray array];
    }
    
    return _cl_dataSource;
}

@end
