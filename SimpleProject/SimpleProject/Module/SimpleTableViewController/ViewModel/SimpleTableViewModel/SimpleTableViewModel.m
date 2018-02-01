//
//  SimpleTableViewModel.m

//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewModel.h"
#import "SimpleTableDataViewModel.h"

@implementation SimpleTableViewModel

- (void)cl_tableViewHTTPRequest {
    
    if (self.cl_dataSource.count) {
        
        [self.cl_dataSource removeAllObjects];

    } else {
        
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
    }
    
    [self.cl_tableViewController.cl_tableView cl_reloadData];
    [self.cl_tableViewController cl_dropDownEndRefresh];    
}

@end
