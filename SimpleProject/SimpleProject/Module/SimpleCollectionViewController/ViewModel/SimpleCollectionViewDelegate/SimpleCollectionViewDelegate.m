//
//  SimpleCollectionViewDelegate.m
//  SimpleProject
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleCollectionViewDelegate.h"

@implementation SimpleCollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击了: %ld", indexPath.row);
}

@end
