//
//  SimpleDrawCircleController.m

//
//  Created by Cain on 2017/7/28.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleDrawCircleController.h"

@interface SimpleDrawCircleController ()

@end

@implementation SimpleDrawCircleController

- (void)dealloc {
    
    NSLog(@"释放了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor grayColor];
    
    NSString *urlString = @"http://cc.cocimg.com/api/uploads/20150803/1438567345483993.jpg";

    UIImageView *simpleProjectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;

    [cache.memoryCache removeAllObjects];
    [cache.diskCache removeAllObjects];
    
    [simpleProjectImageView yy_setImageWithURL:[NSURL URLWithString:urlString]
                                   placeholder:[UIImage imageNamed:@"1"]
                                       options:YYWebImageOptionSetImageWithFadeAnimation
                                      progress:nil
     
                                     transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        
                                         image = [image yy_imageByResizeToSize:CGSizeMake(100, 100)
                                                                   contentMode:UIViewContentModeCenter];

                                         return [image yy_imageByRoundCornerRadius:50];
                                      } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                                          
                                          if (from == YYWebImageFromDiskCache) {
                                              NSLog(@"load from disk cache");
                                          }
                                      }];
    
    [self.view addSubview:simpleProjectImageView];
}

@end
