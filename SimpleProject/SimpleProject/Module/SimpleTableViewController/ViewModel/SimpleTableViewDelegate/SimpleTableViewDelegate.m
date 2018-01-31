//
//  SimpleTableViewDelegate.m

//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewDelegate.h"
#import "SimpleTableDataViewModel.h"

#import "SimpleTableViewPlaceholderView.h"

@interface SimpleTableViewDelegate ()

@property (nonatomic, strong) SimpleTableViewPlaceholderView *simpleTableViewPlaceholderView;

@end

@implementation SimpleTableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SimpleTableDataViewModel *model = self.cl_viewModel.cl_dataSource[indexPath.row];
    
    UIViewController *controller = [[NSClassFromString(model.controllerName) alloc] init];
    
    if (@available(iOS 11.0, *)) {
        
        controller.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    }
    controller.title = model.title;

    [self.cl_viewModel.cl_tableViewController.navigationController pushViewController:controller
                                                                             animated:YES];

}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        return 50;
    } else {
        
        return 80;
    }
}

- (SimpleTableViewPlaceholderView *)simpleTableViewPlaceholderView {
    
    _simpleTableViewPlaceholderView = [[SimpleTableViewPlaceholderView alloc] init];
    
    _simpleTableViewPlaceholderView.backgroundColor = [UIColor redColor];
    
    return _simpleTableViewPlaceholderView;
}

- (UIView *)cl_placeholderView {
    
    return self.simpleTableViewPlaceholderView;
}

- (BOOL)cl_calculateTableViewHeaderViewFrame {
    
    return YES;
}

- (BOOL)cl_scrollEnabledWithShowPlaceholderView {
    
    return YES;
}

@end
