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

@interface ViewController ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self logoQrCode];

    
    [self.view addSubview:self.imageView];
}

- (IBAction)pushButton:(UIButton *)sender {
    
//    SimpleTableViewController *simpleTableViewController = [[SimpleTableViewController alloc] init];
//    
//    [self.navigationController pushViewController:simpleTableViewController
//                                         animated:YES];
    
    SimpleCollectionViewController *simpleCollectionViewController = [[SimpleCollectionViewController alloc] init];
    
    [self.navigationController pushViewController:simpleCollectionViewController
                                         animated:YES];
}

-(UIImageView *)imageView {
    
    if(_imageView == nil){
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.width)];
        
//        [_imageView createQRCodeImageWithString:@"卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽"];
//        [_imageView createQRCodeImageWithString:@"logoNamelogoNamelogoNamelogoName" logo:@"1"];
        
//        [_imageView create128BarcodeImageWithString:@"1111111"];
        [_imageView create128BarcodeImageWithString:@"1111111321"
                                              space:0];
//        _imageView.image = [self generateQRCode:@"哈哈哈哈" width:100 height:100];
    }
    
    return _imageView;
}

@end
