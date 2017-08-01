//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewDelegate.h
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CLTableViewBaseModel.h"

@interface CLTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, strong, readonly) CLTableViewBaseModel *cl_viewModel;

- (instancetype)initTableViewDelegateWithViewModel:(CLTableViewBaseModel *)viewModel;

@end
