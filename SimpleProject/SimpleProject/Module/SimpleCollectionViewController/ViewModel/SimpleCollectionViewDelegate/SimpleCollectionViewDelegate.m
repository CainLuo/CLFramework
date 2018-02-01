//
//  SimpleCollectionViewDelegate.m

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

- (UIView *)cl_placeholderView {
    
    UIView *cl_placeholderView = [[UIView alloc] init];
    
    cl_placeholderView.backgroundColor = [UIColor cyanColor];
    
    return cl_placeholderView;
}

@end
