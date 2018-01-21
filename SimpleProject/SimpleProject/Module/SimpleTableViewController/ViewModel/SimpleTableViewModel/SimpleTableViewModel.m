//
//  SimpleTableViewModel.m

//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewModel.h"
#import "SimpleTableDataViewModel.h"

@interface SimpleTableViewModel ()

@property (nonatomic, assign) BOOL is_empty;

@end

@implementation SimpleTableViewModel

- (void)cl_tableViewHTTPRequest {
    
    [self.cl_dataSource removeAllObjects];

    if (self.is_empty) {
        
        self.is_empty = NO;
        
        NSArray *array = @[@{@"title":@"SimpleCollectionViewController",
                             @"controllerName":@"SimpleCollectionViewController"},
                           @{@"title":@"SimpleQRCodeImageViewController",
                             @"controllerName":@"SimpleQRCodeImageViewController"},
                           @{@"title":@"SimpleImageViewController",
                             @"controllerName":@"SimpleImageViewController"},
                           @{@"title":@"SimpleScrollViewController",
                             @"controllerName":@"SimpleScrollViewController"},
                           @{@"title":@"SimpleButtonController",
                             @"controllerName":@"SimpleButtonController"},
                           @{@"title":@"SimpleDrawCircleController",
                             @"controllerName":@"SimpleDrawCircleController"},
                           @{@"title":@"SimpleTableViewController",
                             @"controllerName":@"SimpleTableViewController"},
                           @{@"title":@"SimpleAttributeStringController",
                             @"controllerName":@"SimpleAttributeStringController"}];
        
        [self.cl_dataSource addObjectsFromArray:[NSArray yy_modelArrayWithClass:[SimpleTableDataViewModel class]
                                                                           json:array]];

    } else {
        
        self.is_empty = YES;
    }
    
    
    [self.cl_tableViewController.cl_tableView reloadData];
    [self.cl_tableViewController cl_dropDownEndRefresh];    
}

@end
