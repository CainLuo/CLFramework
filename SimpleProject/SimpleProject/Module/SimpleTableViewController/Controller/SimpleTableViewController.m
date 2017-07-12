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

@property (nonatomic, strong) CLTitleView *titleView;

@end

@implementation SimpleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self cl_addConstraintsWithSuperView];
    
    [self cl_setTableViewDelegate:self.simpleTableViewDelegate
                       dataSource:self.simpleTableViewDataSource];
    
    [self cl_dropDownBeginRefresh];
    
    NSLog(@"%@", [UIDevice cl_getUUIDString]);
    NSLog(@"%@", [UIDevice cl_getCarrierName]);
    NSLog(@"%@", [UIDevice cl_getCurrentRadioAccessTechnology]);
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
    
    [self.view addSubview:self.titleView];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo([UIScreen cl_fitScreen:128]);
    }];
    
    [self.cl_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleView.mas_bottom);
        make.left.bottom.right.equalTo(self.view);
    }];
}

- (CLTitleView *)titleView {
    
    CL_GET_METHOD_RETURN_OBJC(_titleView);
    
    _titleView = [[CLTitleView alloc] init];
    
    _titleView.backgroundColor = [UIColor grayColor];
    _titleView.cl_titleString  = @"SimpleTableViewController";
    _titleView.cl_titleColor   = [UIColor whiteColor];
    _titleView.cl_titleFont    = 10.0;
    
    return _titleView;
}

@end
