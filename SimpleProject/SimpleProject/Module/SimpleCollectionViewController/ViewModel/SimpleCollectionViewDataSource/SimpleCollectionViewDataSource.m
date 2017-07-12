//
//  SimpleCollectionViewDataSource.m
//  SimpleProject
//
//  Created by Cain on 2017/7/12.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleCollectionViewDataSource.h"

@implementation SimpleCollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

@end
