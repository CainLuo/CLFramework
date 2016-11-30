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
    
    for (NSInteger i = 0; i < 20; i++) {
        
        [self.cl_dataSource addObject:[NSString stringWithFormat:@"%zd", i]];
    }
    
    [self.cl_tableViewController.cl_tableView reloadData];
    [self.cl_tableViewController cl_dropDownEndRefresh];
}

@end
