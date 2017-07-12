//
//  CLCollectionViewDataSource.m
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewDataSource.h"

@interface CLCollectionViewDataSource ()

@property (nonatomic, strong, readwrite) CLCollectionViewBaseModel *cl_collectionViewBaseModel;

@end

@implementation CLCollectionViewDataSource

- (instancetype)initCollectionViewDataSourceWithViewModel:(CLCollectionViewBaseModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        
        self.cl_collectionViewBaseModel = viewModel;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return self.cl_collectionViewBaseModel.cl_dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

@end
