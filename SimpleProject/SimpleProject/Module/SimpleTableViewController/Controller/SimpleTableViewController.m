//
//  SimpleTableViewController.m
//  SimpleProject
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableViewModel.h"
#import "SimpleTableViewDelegate.h"
#import "SimpleTableViewDataSource.h"

#import "CLTitleView.h"

@interface SimpleTableViewController ()

@property (nonatomic, strong) SimpleTableViewModel *simpleTableViewModel;
@property (nonatomic, strong) SimpleTableViewDelegate *simpleTableViewDelegate;
@property (nonatomic, strong) SimpleTableViewDataSource *simpleTableViewDataSource;

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
}

- (void)cl_dropDownRefresh {
    
    [self.simpleTableViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    [self cl_pullUpEndRefresh];
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

- (void)cl_addConstraintsWithSuperView {
    
    [self.cl_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.edges;
    }];
}

@end
