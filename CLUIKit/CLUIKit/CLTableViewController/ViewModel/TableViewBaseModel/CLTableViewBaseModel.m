//
//  CLTableViewBaseModel.m
//  SimpleProject
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLTableViewBaseModel.h"

@interface CLTableViewBaseModel()

@property (nonatomic, strong, readwrite) CLTableViewController *cl_tableViewController;

@end

@implementation CLTableViewBaseModel

- (instancetype)initTableViewBaseModelWithController:(CLTableViewController *)viewController {
    
    self = [super init];
    
    if (self) {
        self.cl_tableViewController = viewController;
    }
    
    return self;
}

- (NSMutableArray *)cl_dataSource {
    
    if (!_cl_dataSource) {
        
        _cl_dataSource = [NSMutableArray array];
    }
    
    return _cl_dataSource;
}

- (void)cl_tableViewHTTPRequest {
    
}

@end
