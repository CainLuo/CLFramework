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
#import "Masonry.h"

@interface SimpleTableViewController ()

@property (nonatomic, strong) SimpleTableViewModel *simpleTableViewModel;
@property (nonatomic, strong) SimpleTableViewDelegate *simpleTableViewDelegate;

@end

@implementation SimpleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_setTableViewDelegate:self.simpleTableViewDelegate
                       dataSource:self.simpleTableViewDelegate];
    
    [self cl_dropDownBeginRefresh];
}

- (void)cl_dropDownRefresh {
    
    [self.simpleTableViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    [self cl_pullUpEndRefresh];
}

- (SimpleTableViewModel *)simpleTableViewModel {

    if (!_simpleTableViewModel) {
        _simpleTableViewModel = [[SimpleTableViewModel alloc] initTableViewBaseModelWithController:self];
    }

    return _simpleTableViewModel;
}

- (SimpleTableViewDelegate *)simpleTableViewDelegate {
    
    if (!_simpleTableViewDelegate) {
        
        _simpleTableViewDelegate = [[SimpleTableViewDelegate alloc] initTableViewDelegateWithViewModel:self.simpleTableViewModel];
    }
    
    return _simpleTableViewDelegate;
}

- (void)cl_addConstraintsWithSuperView {
}

@end
