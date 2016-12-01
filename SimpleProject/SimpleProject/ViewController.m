//
//  ViewController.m
//  SimpleProject
//
//  Created by Cain Luo on 28/11/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableViewController.h"
#import "SimpleCollectionViewController.h"
#import "UIViewController+CLViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
}

- (IBAction)pushButton:(UIButton *)sender {
    
    SimpleTableViewController *simpleTableViewController = [[SimpleTableViewController alloc] init];
    
    [self.navigationController pushViewController:simpleTableViewController
                                         animated:YES];
    
//    SimpleCollectionViewController *simpleCollectionViewController = [[SimpleCollectionViewController alloc] init];
//    
//    [self.navigationController pushViewController:simpleCollectionViewController animated:YES];
}

@end
