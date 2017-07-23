//
//  SimpleTableViewModel.m
//  SimpleProject
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewModel.h"

@implementation SimpleTableViewModel

- (void)cl_tableViewHTTPRequest {

    NSArray *array = @[@"SimpleCollectionViewController",
                       @"SimpleQRCodeImageViewController",
                       @"SimpleImageViewController"];
    
    [self.cl_dataSource addObjectsFromArray:array];
    
    [self.cl_tableViewController.cl_tableView reloadData];
    [self.cl_tableViewController cl_dropDownEndRefresh];
    
    [self cl_configTableViewWithDataSource];
}

@end
