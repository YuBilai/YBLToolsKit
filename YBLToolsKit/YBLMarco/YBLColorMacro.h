//
//  YBLColorMacro.h
//  ExampleDemo
//
//  Created by 康美通 on 2018/9/14.
//  Copyright © 2018年 康美通. All rights reserved.
//

#ifndef YBLColorMacro_h
#define YBLColorMacro_h

#pragma mark -------- 常用颜色
#define kWHITECOLOR [UIColor whiteColor]
#define kBLACKCOLOR [UIColor blackColor]
#define kGREENCOLOR [UIColor greenColor]
#define kGRAYCOLOR  [UIColor grayColor]
#define kORANGECOLOR [UIColor orangeColor]
#define kCLEARCOLOR [UIColor clearColor]
#define kBROWNCOLOR [UIColor brownColor]
#define kMAGENTACOLOR [UIColor magentaColor]
#define kPURPLECOLOR [UIColor purpleColor]
#define kCYANCOLOR [UIColor cyanColor]
#define kYELLOWCOLOR [UIColor yellowColor]
#define kBLUECOLOR [UIColor blueColor]
#define kLIGHTGRAYCOLOR [UIColor lightGrayColor]
#define kDARKGRAYCOLOR [UIColor darkGrayColor]

#pragma mark -------- 随机色
#define kYBLRandomColor YBLColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)

#pragma mark --------  颜色16进制
#define kYBLRGBValue(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#endif /* YBLColorMacro_h */
