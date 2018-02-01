//
//  UICollectionView+CLCollectionView.m
//  SimpleProject
//
//  Created by Cain Luo on 2018/1/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "UICollectionView+CLCollectionView.h"
#import "UIColor+CLColor.h"
#import <objc/runtime.h>

static void *CLPlaceholderView = &CLPlaceholderView;

@implementation UICollectionView (CLCollectionView)

#pragma mark - CLPlaceholderView
- (void)setCl_placeholderView:(UIView *)cl_placeholderView {
    
    objc_setAssociatedObject(self, CLPlaceholderView, cl_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)cl_placeholderView {
    
    return objc_getAssociatedObject(self, CLPlaceholderView);
}

- (void)cl_reloadData {
    
    [self reloadData];
    
    [self cl_checkEmpty];
}

#pragma mark - Check Empty
- (void)cl_checkEmpty {
    
    BOOL cl_isEmpty = YES;
    
    id<UICollectionViewDataSource> cl_dataSource = self.dataSource;
    
    NSInteger cl_sections = 1;
    
    if ([cl_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        
        cl_sections = [cl_dataSource numberOfSectionsInCollectionView:self];
    }
    
    for (int i = 0; i < cl_sections; ++i) {
        
        NSInteger rows = [cl_dataSource collectionView:self
                                numberOfItemsInSection:i];
        
        if (rows) {
            
            cl_isEmpty = NO;
        }
    }
    
    if (!cl_isEmpty != !self.cl_placeholderView) {
        
        if (cl_isEmpty) {
            
            self.scrollEnabled = [self cl_responseScrollEnabledWithShowPlaceholderView];
            
            self.cl_placeholderView = [self cl_responseTableViewPlaceholderView];
            
            self.cl_placeholderView.frame = self.frame;
            
            [self addSubview:self.cl_placeholderView];
        } else {
            
            [self.cl_placeholderView removeFromSuperview];
            
            self.cl_placeholderView = nil;
        }
        
    } else if (cl_isEmpty){
        
        self.scrollEnabled = [self cl_responseScrollEnabledWithShowPlaceholderView];
        
        [self.cl_placeholderView removeFromSuperview];
        
        [self addSubview:self.cl_placeholderView];
    }
}

#pragma mark - Response Delegate Method
- (UIView *)cl_responseTableViewPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(cl_placeholderView)]) {
        
        return [self.delegate performSelector:@selector(cl_placeholderView)];
        
    } else if ([self respondsToSelector:@selector(cl_placeholderView)]) {
        
        return [self performSelector:@selector(cl_placeholderView)];
    } else {
        
        return nil;
    }
}

#pragma mark - Response Delegate Method
- (BOOL)cl_responseScrollEnabledWithShowPlaceholderView {
    
    if ([self.delegate respondsToSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)]) {
        
        return [self.delegate performSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)];
        
    } else if ([self respondsToSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)]) {
        
        return [self performSelector:@selector(cl_scrollEnabledWithShowPlaceholderView)];
        
    } else {
        
        return YES;
    }
}

@end
