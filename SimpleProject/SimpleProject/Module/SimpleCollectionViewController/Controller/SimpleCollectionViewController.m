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

@interface SimpleCollectionViewController ()

@property (nonatomic, strong) SimpleCollectionViewDelegate *simpleCollectionViewDelegate;
@property (nonatomic, strong) SimpleCollectionViewModel *simpleCollectionViewModel;

@end

@implementation SimpleCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cl_setCollectionViewDelegate:self.simpleCollectionViewDelegate
                            dataSource:self.simpleCollectionViewDelegate];
    
    [self cl_registerClass:[UICollectionViewCell class]
                identifier:@"UICollectionViewCell"];
    
    [self cl_dropDownBeginRefresh];
    
    NSLog(@"%@", [[NSLocale preferredLanguages] objectAtIndex:0]);
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
        
        _simpleCollectionViewDelegate = [[SimpleCollectionViewDelegate alloc] initCollectionViewWithViewModel:self.simpleCollectionViewModel];
    }
    
    return _simpleCollectionViewDelegate;
}

@end
