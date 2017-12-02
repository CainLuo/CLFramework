//
//  SimpleTableViewCell.h
//  SimpleProject
//
//  Created by Cain on 2017/9/3.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "CLTableViewCell.h"
#import "SimpleTableDataViewModel.h"

@interface SimpleTableViewCell : CLTableViewCell

- (void)configSimpleTableViewCellWithModel:(SimpleTableDataViewModel *)model;

@end
