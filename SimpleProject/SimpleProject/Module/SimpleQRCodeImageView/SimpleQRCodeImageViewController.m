//
//  SimpleQRCodeImageViewController.m

//
//  Created by Cain on 2016/12/8.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "SimpleQRCodeImageViewController.h"

@interface SimpleQRCodeImageViewController ()

@end

@implementation SimpleQRCodeImageViewController

- (void)dealloc {
    
    NSLog(@"释放了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSStringFromClass([self class]);

    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    imageView.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    
    
    [UIImage cl_asyncCreateQRCodeImageWithString:@"https://cainrun.github.io"
                                      completion:^(UIImage *image) {
                                          
                                          imageView.image = image;
                                      }];
    
    [self.view addSubview:imageView];
    
//    [self cl_showAlertViewControllerWithTitle:@"温馨提示"
//                                      message:@"进入了二维码控制器"
//                                  buttonTitle:@"好的"];
        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [dateFormatter dateFromString:@"2018-01-14"];
    
    NSLog(@"%ld", [NSDate cl_getWeekdayStringFromDate:date]);
    
    NSLog(@"this day is %@", [self getTheDayOfTheWeekByDateString:date]);
}


- (NSString *)getTheDayOfTheWeekByDateString:(NSDate *)date {
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"EEEE-MMMM-d"];
    
    NSString *outputDateStr = [outputFormatter stringFromDate:date];
    
    NSArray *weekArray = [outputDateStr componentsSeparatedByString:@"-"];
    
    return weekArray.firstObject;
}
@end
