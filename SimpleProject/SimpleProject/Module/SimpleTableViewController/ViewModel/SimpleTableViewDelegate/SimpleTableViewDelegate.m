//
//  SimpleTableViewDelegate.m

//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewDelegate.h"
#import "SimpleQRCodeImageViewController.h"
#import "SimpleCollectionViewController.h"
#import "SimpleImageViewController.h"
#import "SimpleScrollViewController.h"
#import "SimpleButtonController.h"
#import "SimpleDrawCircleController.h"

@implementation SimpleTableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
            
            [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:QRCodeImageViewController
                                                                                     animated:YES];
        }
            break;
        case 2: {
            
            SimpleImageViewController *imageViewController = [[SimpleImageViewController alloc] init];
            
            imageViewController.hidesBottomBarWhenPushed = YES;
            
            [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:imageViewController
                                                                                     animated:YES];
        }
            break;
            
        case 3: {
            
            SimpleScrollViewController *scrollViewController = [[SimpleScrollViewController alloc] init];
            
            scrollViewController.hidesBottomBarWhenPushed = YES;
            
            [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:scrollViewController
                                                                                     animated:YES];
        }
            break;
        case 4: {
            
            SimpleButtonController *simpleButtonController = [[SimpleButtonController alloc] init];
            
            simpleButtonController.hidesBottomBarWhenPushed = YES;
            
            [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:simpleButtonController
                                                                                     animated:YES];
        }
            break;
        case 5: {
            
            SimpleDrawCircleController *simpleDrawCircleController = [[SimpleDrawCircleController alloc] init];
            
            simpleDrawCircleController.hidesBottomBarWhenPushed = YES;
            
            [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:simpleDrawCircleController
                                                                                     animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
