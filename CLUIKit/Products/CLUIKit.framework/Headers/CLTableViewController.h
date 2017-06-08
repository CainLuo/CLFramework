//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewController.h
//  SimpleProject
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLTableViewController : UIViewController

@property (nonatomic, strong, readonly) UITableView *cl_tableView;

- (void)cl_removeRefresh;
- (void)cl_removeHeaderRefresh;
- (void)cl_removeFooterRefresh;

- (void)cl_dropDownRefresh;
- (void)cl_pullUpRefresh;

- (void)cl_dropDownBeginRefresh;
- (void)cl_dropDownEndRefresh;

- (void)cl_pullUpBeginRefresh;
- (void)cl_pullUpEndRefresh;

- (void)cl_setTableViewDelegate:(_Nullable id <UITableViewDelegate>)delegate
                     dataSource:(_Nullable id <UITableViewDataSource>)dataSource;

@end
NS_ASSUME_NONNULL_END
