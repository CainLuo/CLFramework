//
//  ViewController.m
//  CLFoundation
//
//  Created by Cain Luo on 10/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"

#import "UIScreen+CLScreen.h"
#import "UIDevice+CLDevice.h"
#import "UIColor+CLColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cl_getARC4RandomColor];

    NSLog(@"value: %f", [UIScreen cl_fitScreen:306]);
    
    NSLog(@"%f", [UIScreen cl_getNavigationBarHeight]);
    NSLog(@"%f", [UIScreen cl_getStatusBarHeight]);
    
    NSLog(@"%@", [UIDevice cl_getSystemVersion]);
    NSLog(@"%@", [UIDevice cl_getDeviceName]);
    NSLog(@"%@", [UIDevice cl_getDeviceModelType]);
    
    NSLog(@"%@", [UIColor cl_getARC4RandomColor]);
}

@end
