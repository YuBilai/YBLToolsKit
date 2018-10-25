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

/**
 *  从图片中点开始拉伸
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
/**
 *  从制定位置开始拉伸图片
 *
 *  @param name   图片名字
 *  @param scaleW x
 *  @param scaleH y
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name scaleW:(CGFloat)scaleW scaleH:(CGFloat)scaleH;


/**
 *  对画布裁剪成圆形,然后再将原始图像画出来
 *
 *  @param imageName 图片名
 *  @param inset     偏移量 建议为0，使用默认大小
 */
+ (UIImage*)imageCircle:(NSString*)imageName withParam:(CGFloat)inset;
/**
 *  对画布裁剪成圆形,然后再将原始图像画出来
 *
 *  @param imageName    图片名
 *  @param inset        偏移量 建议为0，使用默认大小
 *  @param contextWdith 边框宽度
 *  @param contextColor 边框颜色
 */
+ (UIImage*)imageCircle:(NSString*)imageName withParam:(CGFloat)inset contextWidth:(CGFloat)contextWdith contextColor:(UIColor*)contextColor;

@end
