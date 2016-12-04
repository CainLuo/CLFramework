//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLTableViewBaseModel.h
//  SimpleProject
//
//  Created by Cain on 2016/11/30.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTableViewController.h"

@interface CLTableViewBaseModel : NSObject

@property (nonatomic, strong) NSMutableArray *cl_dataSource;
@property (nonatomic, strong, readonly) CLTableViewController *cl_tableViewController;

- (instancetype)initTableViewBaseModelWithController:(CLTableViewController *)viewController;

- (void)cl_tableViewHTTPRequest;

@end
