//
//  SimpleTableViewDataSource.m

//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewDataSource.h"
#import "SimpleTableViewCell.h"

@implementation SimpleTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SimpleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableViewCell"];
    
    if (!cell) {
        
        cell = [[SimpleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:@"SimpleTableViewCell"];
    }
    
    [cell configSimpleTableViewCellWithModel:self.cl_viewModel.cl_dataSource[indexPath.row]];
    
    return cell;
}

@end
