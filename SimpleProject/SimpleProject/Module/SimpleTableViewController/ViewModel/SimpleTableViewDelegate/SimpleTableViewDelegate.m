//
//  SimpleTableViewDelegate.m
//  SimpleProject
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewDelegate.h"
#import "SimpleQRCodeImageViewController.h"
#import "SimpleCollectionViewController.h"

@implementation SimpleTableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cl_viewModel.cl_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    cell.textLabel.text = self.cl_viewModel.cl_dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
            
        case 0: {
            SimpleCollectionViewController *collectionViewController = [[SimpleCollectionViewController alloc] init];
            
            collectionViewController.hidesBottomBarWhenPushed = YES;
            
            [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:collectionViewController
                                                                                     animated:YES];
        }
            break;
        case 1: {
            
            SimpleQRCodeImageViewController *QRCodeImageViewController = [[SimpleQRCodeImageViewController alloc] init];
            
            QRCodeImageViewController.hidesBottomBarWhenPushed = YES;
            
            [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:QRCodeImageViewController
                                                                                     animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
