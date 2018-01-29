//
//  SimpleCollectionViewController.m

//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleCollectionViewController.h"
#import "SimpleCollectionViewDelegate.h"
#import "SimpleCollectionViewModel.h"
#import "SimpleCollectionViewDataSource.h"

@interface SimpleCollectionViewController ()

@property (nonatomic, strong) SimpleCollectionViewDelegate *simpleCollectionViewDelegate;
@property (nonatomic, strong) SimpleCollectionViewDataSource *simpleCollectionViewDataSource;
@property (nonatomic, strong) SimpleCollectionViewModel *simpleCollectionViewModel;

@end

@implementation SimpleCollectionViewController

- (void)dealloc {
    
    NSLog(@"释放了");
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.hidden = YES;
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = NO;

    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);

    [self cl_setCollectionViewDelegate:self.simpleCollectionViewDelegate
                            dataSource:self.simpleCollectionViewDataSource];
    
    [self cl_registerClass:[UICollectionViewCell class]
                identifier:@"UICollectionViewCell"];
    
    [self cl_dropDownBeginRefresh];
    [self cl_addConstraintsWithSuperView];
    
    NSLog(@"%f", [UIScreen cl_getStatusBarHeight]);
}

- (void)cl_dropDownRefresh {
    
    [self.simpleCollectionViewModel cl_collectionViewHTTPRequest];
}

- (SimpleCollectionViewModel *)simpleCollectionViewModel {
    
    if (!_simpleCollectionViewModel) {
        
        _simpleCollectionViewModel = [[SimpleCollectionViewModel alloc] initCollectionViewBaseModelWithController:self];
    }
    
    return _simpleCollectionViewModel;
}

- (SimpleCollectionViewDelegate *)simpleCollectionViewDelegate {
    
    if (!_simpleCollectionViewDelegate) {
        
        _simpleCollectionViewDelegate = [[SimpleCollectionViewDelegate alloc] initCollectionViewDelegateWithViewModel:self.simpleCollectionViewModel];
    }
    
    return _simpleCollectionViewDelegate;
}

- (SimpleCollectionViewDataSource *)simpleCollectionViewDataSource {
    
    CL_GET_METHOD_RETURN_OBJC(_simpleCollectionViewDataSource);
    
    _simpleCollectionViewDataSource = [[SimpleCollectionViewDataSource alloc] initCollectionViewDataSourceWithViewModel:self.simpleCollectionViewModel];
    
    return _simpleCollectionViewDataSource;
}

- (void)cl_addConstraintsWithSuperView {
}

@end
