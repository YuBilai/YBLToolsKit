//
//  UIImage+ImageUtils.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/19.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtils)
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
+ (UIImage *)imageWithColorHexString:(NSString *)hexColor andSize:(CGSize)size;
+(UIImage *)stretchableImageWithImageNamed:(NSString *)imageNamed;

- (UIImage *)scaleToSize:(CGSize)newsize;

- (UIImage *)imageWithOverlayColor:(UIColor *)color;
- (UIImage*) imageTransparent:(UIColor*)color Percent:(float)f;

// 生成一张指定颜色的图片
+ (UIImage *)imageWithColor:(UIColor*)color;
//调整生成的图片的大小
+ (UIImage *)resizeCodeImage:(CIImage *)image withSize:(CGSize)size;
#pragma mark --截图
- (UIImage*)cropImageWithRect:(CGRect)cropRect;


#pragma mark -
#pragma mark -  ztx add start

- (UIImage *)scaledImageV2WithWidth:(CGFloat)aWidth andHeight:(CGFloat)aHeight;
- (UIImage *) scaledImageWithWidth:(CGFloat)width andHeight:(CGFloat)height;
- (UIImage *)scaledHeadImageWithWidth:(CGFloat)aWidth andHeight:(CGFloat)aHeight;

///  图片压缩
+(NSData *)compressImage:(UIImage *)aSrcImage       //原始图
              andQuality:(CGFloat)aQuality          //图片压缩质量
              andMaxSize:(CGSize)maxSize             //图片最大尺寸，宽*高
        andMaxDataLength:(NSUInteger)maxDataLength; //返回NSData 的长度,单位是KByte

/// 画虚线
+ (UIImage *)drawLineByImageView:(UIImageView *)imageView width:(NSInteger)width;
- (BOOL)isEqualToImage:(UIImage *)image;
/// 生成指定大小二维码
+ (UIImage *)creatRacode:(NSString *)urlstring Width:(NSInteger)imgHW;

@end
