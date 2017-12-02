//
//  SimpleImageViewController.m

//
//  Created by Cain on 2017/3/27.
//  Copyright © 2017年 Cain Luo. All rights reserved.
//

#import "SimpleImageViewController.h"
#import "SimpleImageViewModel.h"

@interface SimpleImageViewController ()

@property (nonatomic, strong) UIImageView *simpleImageView;

@property (nonatomic, strong) SimpleImageViewModel *simpleImageViewModel;

@end

@implementation SimpleImageViewController

- (void)dealloc {
    
    NSLog(@"释放了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.title = NSStringFromClass([self class]);

    UIButton *button = [[UIButton alloc] init];
    
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateNormal];
    [button setTitle:@"截取"
            forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(buttonAction)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    NSLog(@"%@", self);
    
    _simpleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                     64,
                                                                     [UIScreen cl_getScreenWidth],
                                                                     200)];
    _simpleImageView.backgroundColor = [UIColor whiteColor];
    _simpleImageView.contentMode     = UIViewContentModeScaleAspectFit;
    _simpleImageView.image           = [UIImage imageNamed:@"1"];

//    [UIImage cl_asyncBlurImageWithBlur:0.3
//                                 image:[UIImage imageNamed:@"1"]
//                            completion:^(UIImage *image) {
//
//                                self.simpleImageView.image = image;
//                            }];
    
//    [UIImage cl_asyncCornerImageWithRadius:40
//                                     image:[UIImage imageNamed:@"1"]
//                                completion:^(UIImage *image) {
//
//                                    self.simpleImageView.image = image;
//                                }];
    
    [self.view addSubview:_simpleImageView];
}

- (SimpleImageViewModel *)simpleImageViewModel {
    
    CL_GET_METHOD_RETURN_OBJC(_simpleImageViewModel);
    
    _simpleImageViewModel = [[SimpleImageViewModel alloc] initViewControllerViewModelWithController:self];
    
    return _simpleImageViewModel;
}

- (void)buttonAction {
    
//    [UIImage cl_asyncGetImageForView:self.view
//                          completion:^(UIImage *image) {
//
//                         self.simpleImageView.image = image;
//                     }];
    
//    cl_asyncCornerImageWithSize
    
    self.simpleImageView.image = [self.simpleImageView.image cl_animatedImageByScalingAndCroppingToSize:CGSizeMake(10, 10)];
    
    [UIImage cl_asyncDrawImageToSize:CGSizeMake(50, 50)
                               image:[UIImage imageNamed:@"1"]
                          completion:^(UIImage *image) {
        
                              self.simpleImageView.image = image;
                          }];
    
//    [UIImage cl_asyncCornerImageWithSize:CGSizeMake(100, 100)
//                                   image:self.simpleImageView.image
//                             borderWidth:2
//                             borderColor:[UIColor redColor]
//                              completion:^(UIImage *image) {
//
//                                  self.simpleImageView.image = image;
//                              }];
    
//    [UIImage cl_asyncBlurImageWithBlur:0.3
//                                 image:[UIImage imageNamed:@"1"]
//                            completion:^(UIImage *image) {
//
//                                self.simpleImageView.image = image;
//                            }];
}

@end
