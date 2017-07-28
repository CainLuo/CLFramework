//
//  SimpleCollectionViewController.m
//  SimpleProject
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

@property (nonatomic, strong) CLTitleView *simpleTitleView;

@end

@implementation SimpleCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);

    [self cl_setCollectionViewDelegate:self.simpleCollectionViewDelegate
                            dataSource:self.simpleCollectionViewDataSource];
    
    [self cl_registerClass:[UICollectionViewCell class]
                identifier:@"UICollectionViewCell"];
    
    [self cl_dropDownBeginRefresh];
    [self cl_addConstraintsWithSuperView];
}

- (CLTitleView *)simpleTitleView {
    
    CL_GET_METHOD_RETURN_OBJC(_simpleTitleView);
    CL_WEAK_SELF(weakSelf);
    
    _simpleTitleView = [[CLTitleView alloc] initCLTitleViewWithType:CLTitleViewCloseType];

    [_simpleTitleView cl_needLeftButton];
    [_simpleTitleView cl_needRightButton];
    
    _simpleTitleView.backgroundColor = [UIColor grayColor];
    _simpleTitleView.cl_titleString = @"SimpleCollectionViewController";
    
    [_simpleTitleView setCl_titleViewLeftButtonBlock:^(UIButton *sender){
        
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    return _simpleTitleView;
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
    
    [self.view addSubview:self.simpleTitleView];
    
    [self.simpleTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo([UIScreen cl_fitScreen:128]);
    }];
    
    [self.cl_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.simpleTitleView.mas_bottom);
    }];
}

@end
