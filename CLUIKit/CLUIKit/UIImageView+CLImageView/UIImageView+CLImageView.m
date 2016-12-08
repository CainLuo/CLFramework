//
//  UIImageView+CLImageView.m
//  SimpleProject
//
//  Created by Cain on 2016/12/8.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIImageView+CLImageView.h"

@implementation UIImageView (CLImageView)

#pragma mark - QR Code Image
- (void)createQRCodeImageWithString:(NSString *)string {
    
    CIFilter *QRCodeImageFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [QRCodeImageFilter setDefaults];
    
    NSData *QRCodeImageData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    [QRCodeImageFilter setValue:QRCodeImageData
                         forKey:@"inputMessage"];
    [QRCodeImageFilter setValue:@"H"
                         forKey:@"inputCorrectionLevel"];

    CIImage *QRCodeCIImage = [QRCodeImageFilter outputImage];
    
    QRCodeCIImage = [QRCodeCIImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
    
    UIImage *QRCodeUIImage = [UIImage imageWithCIImage:QRCodeCIImage];
    
    self.image = QRCodeUIImage;
}

- (void)createQRCodeImageWithString:(NSString *)string
                               logo:(NSString *)logoName {
    
    [self createQRCodeImageWithString:string];
    
    UIGraphicsBeginImageContext(self.image.size);
    
    [self.image drawInRect:CGRectMake(0, 0, self.image.size.width, self.image.size.height)];
    
    UIImage *sImage = [UIImage imageNamed:logoName];
    
    CGFloat sImageW = 150;
    CGFloat sImageH= sImageW;
    CGFloat sImageX = (self.image.size.width - sImageW) * 0.5;
    CGFloat sImgaeY = (self.image.size.height - sImageH) * 0.5;
    
    [sImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
    
    UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.image = finalyImage;
}

#pragma mark - 128 Bar Code Image
- (void)create128BarcodeImageWithString:(NSString *)string {
    
    [self create128BarcodeImageWithString:string
                                    space:7];
}

- (void)create128BarcodeImageWithString:(NSString *)string
                                  space:(CGFloat)space {
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    
    NSData *contentData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    [qrFilter setValue:contentData
                forKey:@"inputMessage"];
    [qrFilter setValue:@(space)
                forKey:@"inputQuietSpace"];
    
    CIImage *barCodeImage = qrFilter.outputImage;
    
    barCodeImage = [barCodeImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
    
    UIImage *barCodeUIImage = [UIImage imageWithCIImage:barCodeImage];
    
    self.image = barCodeUIImage;
}

@end
