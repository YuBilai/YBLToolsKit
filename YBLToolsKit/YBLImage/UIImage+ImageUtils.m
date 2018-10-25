//
//  UIImage+ImageUtils.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/19.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "UIImage+ImageUtils.h"

@implementation UIImage (ImageUtils)
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithColorHexString:(NSString *)hexColor andSize:(CGSize)size{
    
    UIColor *color=[UIColor colorWithHexString:hexColor];
    UIImage *image=[self imageWithColor:color andSize:size];
    return image;
}
+(UIImage *)stretchableImageWithImageNamed:(NSString *)imageNamed{
    
    UIImage *img=[UIImage imageNamed:imageNamed];
    img=[img stretchableImageWithLeftCapWidth:15 topCapHeight:12];
    return img;
}

#pragma mark - 修改图片大小尺寸
- (UIImage *)scaleToSize:(CGSize)newsize{
    
    // 创建一个bitmap的context
    
    // 并把它设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(newsize);
    
    // 绘制改变大小的图片
    
    [self drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
    
}

- (UIImage *)imageWithOverlayColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    
    if (UIGraphicsBeginImageContextWithOptions) {
        CGFloat imageScale = 1.0f;
        if (self && [self respondsToSelector:@selector(scale)])  // The scale property is new with iOS4.
            imageScale = self.scale;
        UIGraphicsBeginImageContextWithOptions(self.size, NO, imageScale);
    }
    else {
        UIGraphicsBeginImageContext(self.size);
    }
    
    [self drawInRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

void ProviderReleaseData (void *info, const void *data, size_t size)
{
    free((void*)data);
}

- (UIImage*) imageTransparent:(UIColor*)color Percent:(float)f
{
    // 分配内存
    const int imageWidth = self.size.width;
    const int imageHeight = self.size.height;
    size_t      bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    // 创建context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), self.CGImage);
    
    // 遍历像素
    int pixelNum = imageWidth * imageHeight*f;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < imageHeight;i++)
    {
        for(int i = 0;i<imageWidth;i++)
        {
            if ((*pCurPtr & 0xFFFFFF00) == 0xff440000)    // 将白色变成透明
            {
                uint8_t* ptr = (uint8_t*)pCurPtr;
                ptr[0] = 0x00;
                ptr[1] = 0xff;
                ptr[2] = 0x00;
            }
        }
    }
    
    
    // 将内存转成image
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
    // 释放
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    // free(rgbImageBuf) 创建dataProvider时已提供释放函数，这里不用free
    
    return resultUIImage;
}


// 生成一张指定颜色的图片
+(UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/**
 *  调整生成的图片的大小
 *
 *  @param image CIImage对象
 *  @param size  需要的UIImage的大小
 *
 *  @return size大小的UIImage对象
 */
+ (UIImage *)resizeCodeImage:(CIImage *)image withSize:(CGSize)size
{
    if (image) {
        CGRect extent = CGRectIntegral(image.extent);
        CGFloat scaleWidth = size.width/CGRectGetWidth(extent);
        CGFloat scaleHeight = size.height/CGRectGetHeight(extent);
        size_t width = CGRectGetWidth(extent) * scaleWidth;
        size_t height = CGRectGetHeight(extent) * scaleHeight;
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
        CGContextRef contentRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef imageRef = [context createCGImage:image fromRect:extent];
        CGContextSetInterpolationQuality(contentRef, kCGInterpolationNone);
        CGContextScaleCTM(contentRef, scaleWidth, scaleHeight);
        CGContextDrawImage(contentRef, extent, imageRef);
        CGImageRef imageRefResized = CGBitmapContextCreateImage(contentRef);
        CGContextRelease(contentRef);
        CGImageRelease(imageRef);
        return [UIImage imageWithCGImage:imageRefResized];
    }else{
        return nil;
    }
}


#pragma mark --截图
- (UIImage*)cropImageWithRect:(CGRect)cropRect
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(cropRect.size.width, cropRect.size.height), NO, 0);
    
    [self drawAtPoint:CGPointMake(-cropRect.origin.x, -cropRect.origin.y)];
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}



+(NSData *)compressImage:(UIImage *)aSrcImage       //原始图
              andQuality:(CGFloat)aQuality          //图片压缩质量
              andMaxSize:(CGSize)maxSize             //图片最大尺寸，宽*高
        andMaxDataLength:(NSUInteger)maxDataLength{
    
    if (aSrcImage == nil) {
        return nil;
    }
    int imageSize = (int)maxDataLength;
    NSData *ret = nil;
    
    if (aQuality>1 || aQuality < 0.3){
        aQuality = 0.65;
    }
    
    NSLog(@"<_compressAndSend> ========== Start ==========");
    UIImage *image = aSrcImage;
    CGSize sizeBig = aSrcImage.size;
    CGFloat maxLength = (maxSize.width > maxSize.height ? maxSize.width : maxSize.height);
    double rateW = maxLength/sizeBig.width;
    double rateH = maxLength/sizeBig.height;
    double rate = rateW<rateH?rateW:rateH;
    
    image = [aSrcImage scaledImageWithWidth:sizeBig.width*rate andHeight:sizeBig.height*rate];
    NSLog(@"<_compressAndSend> 图片尺寸压缩到 = %f x %f",image.size.width,image.size.height);
    
    //原始图片文件体积
    NSData *data = UIImageJPEGRepresentation(image,aQuality);
    //    NSLog(@"<_compressAndSend> 原始图片文件大小%u,直接发送",[data length]);
    
    //如果文件体积小于  直接发送
    if ([data length] < 1024 * imageSize){
        NSLog(@"<_compressAndSend> 图片文件体积小于%ldK,直接发送",maxDataLength);
        ret = data;
    }else{
        NSLog(@"<_compressAndSend> 图片文件体积大于%ldK,准备压缩后发送",maxDataLength);
        NSData *data  = UIImageJPEGRepresentation(image,aQuality);
        NSInteger i = 1;
        while([data length] > 1024 *imageSize)
        {
            NSLog(@"<_compressAndSend> 正在进行第%ld次压缩,压缩前文件体积：%lu",(long)i,[data length]);
            
            rate = rate * 0.8;
            image = [aSrcImage scaledImageWithWidth:sizeBig.width * rate andHeight:sizeBig.height * rate];
            data = UIImageJPEGRepresentation(image,aQuality);
            NSLog(@"<_compressAndSend> 第%ld次压缩完成,压缩后文件体积：%lu",(long)i,[data length]);
            i++;
        }
        ret = data;
    }
    return ret;
}


- (UIImage *)scaledImageV2WithWidth:(CGFloat)aWidth andHeight:(CGFloat)aHeight{
    CGRect rect = CGRectIntegral(CGRectMake(0, 0, aWidth,aHeight));
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UIImage *)scaledImageWithWidth:(CGFloat)aWidth andHeight:(CGFloat)aHeight
{
    aWidth = aWidth > self.size.width ? self.size.width : aWidth;
    aHeight = aHeight > self.size.height ? self.size.height : aHeight;
    
    CGRect rect = CGRectIntegral(CGRectMake(0, 0, aWidth,aHeight));
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


- (UIImage *)scaledHeadImageWithWidth:(CGFloat)aWidth andHeight:(CGFloat)aHeight
{
    CGSize endSize = CGSizeMake(aWidth, aHeight);
    CGRect backRect = CGRectMake(0, 0, aWidth, aHeight);
    float imagex =0;
    float imagey =0;
    
    BOOL needBack = NO;
    if (self.size.width > self.size.height) {
        aWidth = aWidth > self.size.width ? self.size.width : aWidth;
        imagex =0;
        float ff = self.size.width /aWidth;
        aHeight = self.size.height/ff;
        imagey = (aWidth-aHeight)/2;
        needBack =YES;
        backRect = CGRectMake(0, 0, aWidth, aWidth);
        endSize = CGSizeMake(aWidth, aWidth);
    }
    else if(self.size.width < self.size.height)
    {
        aHeight = aHeight > self.size.height ? self.size.height : aHeight;
        imagey =0;
        float ff = self.size.height /aHeight;
        aWidth = self.size.width/ff;
        imagex = (aHeight-aWidth)/2;
        needBack =YES;
        backRect = CGRectMake(0, 0, aHeight, aHeight);
        endSize = CGSizeMake(aHeight, aHeight);
    }
    else
    {
        aWidth = aWidth > self.size.width ? self.size.width : aWidth;
        aHeight = aHeight > self.size.height ? self.size.height : aHeight;
    }
    CGRect rect = CGRectMake(imagex, imagey, aWidth,aHeight);
    UIGraphicsBeginImageContext(endSize);  //rect.size);
    
    if (needBack) {
        // get a reference to that context we created
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        UIColor *color = [UIColor blackColor];
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextAddRect(context, backRect);
        CGContextDrawPath(context,kCGPathFill);
    }
    [self drawInRect:rect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
// 返回虚线image的方法
+ (UIImage *)drawLineByImageView:(UIImageView *)imageView width:(NSInteger)width{
    // 开始划线 划线的frame
    UIGraphicsBeginImageContext(imageView.bounds.size);
    
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    
    // 获取上下文
    CGContextRef line = UIGraphicsGetCurrentContext();
    
    // 设置线条终点的形状
    CGContextSetLineCap(line, kCGLineCapRound);
    // 设置虚线的长度 和 间距
    CGFloat lengths[] = {2,2};
    
    CGContextSetStrokeColorWithColor(line,[UIColor colorWithHexString:@"979797"].CGColor);
    // 开始绘制虚线
    CGContextSetLineDash(line,1,lengths,2);
    
    CGContextMoveToPoint(line, 0.0, 1.0);
    
    CGContextAddLineToPoint(line, width,1);
    
    CGContextStrokePath(line);
    
    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}
#pragma mark 二维码生成
+ (UIImage *)creatRacode:(NSString *)urlstring Width:(NSInteger)imgHW
{
    //二维码滤镜
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    //恢复滤镜的默认属性
    
    [filter setDefaults];
    
    //将字符串转换成NSData
    
    NSData *data=[urlstring dataUsingEncoding:NSUTF8StringEncoding];
    
    //通过KVO设置滤镜inputmessage数据
    
    [filter setValue:data forKey:@"inputMessage"];
    
    //获得滤镜输出的图像
    
    CIImage *outputImage=[filter outputImage];
    
    //将CIImage转换成UIImage,并放大显示
    
    UIImage* resoultImg =[UIImage createNonInterpolatedUIImageFormCIImage:outputImage withSize:imgHW];
    return resoultImg;
}
//改变二维码大小
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 创建bitmap;
    
    size_t width = CGRectGetWidth(extent) * scale;
    
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    
    CGContextScaleCTM(bitmapRef, scale, scale);
    
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    CGContextRelease(bitmapRef);
    
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}


- (BOOL)isEqualToImage:(UIImage *)image {
    NSData *data1 = UIImagePNGRepresentation(self);
    NSData *data2 = UIImagePNGRepresentation(image);
    if (data1.length == data2.length) {
        return [data1 isEqualToData:data2];
    } else {
        return NO;
    }
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name scaleW:0.5 scaleH:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name scaleW:(CGFloat)scaleW scaleH:(CGFloat)scaleH
{
    UIImage *img = [UIImage imageNamed:name];
    return [img stretchableImageWithLeftCapWidth:img.size.width * scaleW topCapHeight:img.size.height * scaleH];
}


+ (UIImage*)imageCircle:(NSString*)imageName withParam:(CGFloat)inset
{
    return [self imageCircle:imageName withParam:inset contextWidth:0.0 contextColor:[UIColor clearColor]];
}

+ (UIImage*)imageCircle:(NSString*)imageName withParam:(CGFloat)inset contextWidth:(CGFloat)contextWdith contextColor:(UIColor*)contextColor
{
    UIImage *image = [self imageNamed:imageName];
    
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, contextWdith);
    CGContextSetStrokeColorWithColor(context, contextColor.CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

@end
