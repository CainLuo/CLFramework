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

#import "CLTitleView.h"

@interface SimpleTableViewController ()

@property (nonatomic, strong) SimpleTableViewModel *simpleTableViewModel;
@property (nonatomic, strong) SimpleTableViewDelegate *simpleTableViewDelegate;
@property (nonatomic, strong) SimpleTableViewDataSource *simpleTableViewDataSource;

@property (nonatomic, strong) NSString *string;

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
    
    
//    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
//    
//    for (NSInteger i = 0; i < 10000; i++) {
//        
//        dispatch_async(queue, ^{
//            
//            self.string = [NSString stringWithFormat:@"abcdefg%ld", i];
//        });
//    }
}

- (void)cl_dropDownRefresh {
    
    [self.simpleTableViewModel cl_tableViewHTTPRequest];
}

- (void)cl_pullUpRefresh {
    
    [self.simpleTableViewModel cl_tableViewPullUpHTTPRequest];    
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
    
    self.cl_tableView.backgroundColor = [UIColor cl_colorWithHexString:@"#1874de"];
    
    [self.cl_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.edges;
    }];
}


- (void)dealloc {
    
    NSLog(@"释放了");
}

@end
