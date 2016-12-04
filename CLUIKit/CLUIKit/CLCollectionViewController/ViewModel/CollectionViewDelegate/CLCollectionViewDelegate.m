//
//  CLCollectionViewDelegate.m
//  SimpleProject
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "CLCollectionViewDelegate.h"

@interface CLCollectionViewDelegate ()

@property (nonatomic, strong, readwrite) CLCollectionViewBaseModel *cl_collectionViewBaseModel;

@end

@implementation CLCollectionViewDelegate

- (instancetype)initCollectionViewWithViewModel:(CLCollectionViewBaseModel *)viewModel {
    
    self = [super init];
    
    if (self) {
        self.cl_collectionViewBaseModel = viewModel;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

@end
