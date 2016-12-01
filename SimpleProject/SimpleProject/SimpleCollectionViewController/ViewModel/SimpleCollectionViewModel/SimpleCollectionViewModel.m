//
//  SimpleCollectionViewModel.m
//  SimpleProject
//
//  Created by Cain on 2016/12/1.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleCollectionViewModel.h"

@implementation SimpleCollectionViewModel

- (void)cl_collectionViewHTTPRequest {
    
    for (NSInteger i = 0; i < 20; i++) {
        
        [self.cl_dataSource addObject:[NSString stringWithFormat:@"%zd", i]];
    }
    
    [self.cl_collectionViewController.cl_collectionView reloadData];
    [self.cl_collectionViewController cl_dropDownEndRefresh];
}

@end
