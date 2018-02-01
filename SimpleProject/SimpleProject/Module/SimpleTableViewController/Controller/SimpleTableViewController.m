//
//  SimpleTableViewController.m

//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableViewModel.h"
#import "SimpleTableViewDelegate.h"
#import "SimpleTableViewDataSource.h"

@interface SimpleTableViewController ()

@property (nonatomic, strong) SimpleTableViewModel *simpleTableViewModel;
@property (nonatomic, strong) SimpleTableViewDelegate *simpleTableViewDelegate;
@property (nonatomic, strong) SimpleTableViewDataSource *simpleTableViewDataSource;

@property (nonatomic, strong) NSString *string;

@property (nonatomic, strong) UIView *cl_headerView;
@property (nonatomic, strong) UIView *cl_footerView;

@end

@implementation SimpleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self cl_setNavigationBarTranslucentWithBOOL:NO];
    [self cl_setTableViewDelegate:self.simpleTableViewDelegate
                       dataSource:self.simpleTableViewDataSource];
    
    [self cl_dropDownBeginRefresh];
    
    [self cl_addConstraintsWithSuperView];
    
    NSLog(@"导航栏%f", self.navigationController.navigationBar.frame.size.height);
    NSLog(@"状态栏%f", [UIScreen cl_getStatusBarHeight]);
    
    
    NSLog(@"%@", [UIDevice cl_getCurrentDeviceModelName]);
    NSLog(@"%ld", [UIDevice cl_getCurrentDeviceCPUCount]);
    NSLog(@"%f", [UIDevice cl_getCurrentDeviceAllCoreCPUUse]);
    NSLog(@"%@", [UIDevice cl_getCurrentDeviceSingleCoreCPUUse]);
    NSLog(@"%@", [UIDevice cl_getCurrentDeviceIPAddresses]);
    NSLog(@"%@", [UIDevice cl_getCurrentDeviceIPAddressWithWiFi]);
    NSLog(@"%@", [UIDevice cl_getCurrentDeviceIPAddressWithCell]);
}

- (void)cl_dropDownRefresh {
    
    [self.simpleTableViewModel cl_tableViewHTTPRequest];
}

- (SimpleTableViewModel *)simpleTableViewModel {

    CL_GET_METHOD_RETURN_OBJC(_simpleTableViewModel);
    
    _simpleTableViewModel = [[SimpleTableViewModel alloc] initTableViewBaseModelWithController:self];

    return _simpleTableViewModel;
}

- (SimpleTableViewDelegate *)simpleTableViewDelegate {
    
    CL_GET_METHOD_RETURN_OBJC(_simpleTableViewDelegate);
    
    _simpleTableViewDelegate = [[SimpleTableViewDelegate alloc] initTableViewDelegateWithViewModel:self.simpleTableViewModel];
    
    return _simpleTableViewDelegate;
}

- (SimpleTableViewDataSource *)simpleTableViewDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_simpleTableViewDataSource);
    
    _simpleTableViewDataSource = [[SimpleTableViewDataSource alloc] initTableViewDataSourceWithViewModel:self.simpleTableViewModel];
    
    return _simpleTableViewDataSource;
}

- (UIView *)cl_headerView {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_headerView);
    
    _cl_headerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                              0,
                                                              [UIScreen cl_getScreenWidth],
                                                              [UIScreen cl_fitScreen:365])];
    
    _cl_headerView.backgroundColor = [UIColor blackColor];
    
    return _cl_headerView;
}

- (UIView *)cl_footerView {
    
    CL_GET_METHOD_RETURN_OBJC(_cl_footerView);
    
    _cl_footerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                              0,
                                                              [UIScreen cl_getScreenWidth],
                                                              [UIScreen cl_fitScreen:100])];
    
    _cl_footerView.backgroundColor = [UIColor greenColor];
    
    return _cl_footerView;
}

- (void)cl_addConstraintsWithSuperView {
    
    self.cl_tableView.backgroundColor = [UIColor cl_colorWithHexString:@"#1874de"];
    self.cl_tableView.tableHeaderView = self.cl_headerView;
//    self.cl_tableView.tableFooterView = self.cl_footerView;

    [self.cl_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.edges;
    }];
}

- (void)dealloc {
    
    NSLog(@"释放了");
}

@end
