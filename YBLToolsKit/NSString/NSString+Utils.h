//
//  NSString+Utils.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/18.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

#pragma mark -------- 字符串相关方法

/**
 字符串去空格

 @return 无空格字符串
 */
- (NSString *)stringTrimWhitespace;


/**
 手机号加*号处理

 @return *号处理字符串
 */
-(NSString *)securePhoneNumber;


/**
 手机号后四位处理

 @param string ""
 @return result
 */
- (NSString *)secureLastFourCount:(NSString *)string;


/**
 银行卡号码隐藏处理

 @return 隐藏后的字符串
 */
-(NSString *)secureBankCardNumber;


/**
 身份证号码隐藏处理（显示前6位）

 @return 隐藏后的身份证号码
 */
-(NSString *)secureIDCardNumber;


/**
 去除字符串中的空格和换行符

 @param string 原始字符串
 @return 处理后的字符串
 */
+(NSString *)stringDeleteWhiteSpaceWithString:(NSString *)string;


/**
 金额格式化(包含¥字符)

 @param string ""
 @return 格式化字符串
 */
+(NSString *)formatBrushAmount:(NSString *)string;


/**
 金额格式化

 @param string ""
 @return 带分隔符字符
 */
+ (NSString *)formatAmount:(NSString *)string;


/**
 金额格式化（系统方法）

 @param amount ""
 @return 格式化金额
 */
+ (NSString *)stringWithFormatAmount:(double)amount;


/**
 银行卡号格式化

 @param string ""
 @return 格式化卡号
 */
+(NSString *)formatCardNumber:(NSString *)string;


/**
 提取字符串中的数字

 @param string ""
 @return 字符串中的数字
 */
+(float)getIntegerNimberWithString:(NSString *)string;

#pragma mark -------- 计算宽高

/**
 计算字符串宽高

 @param fontSize 字体大小
 @param text 原始字符串
 @return 字符串宽高
 */
-(CGSize)stringWidthWithFont:(CGFloat)fontSize andText:(NSString *)text;

/**
 计算字符串长度

 @param fontSize 字体大小
 @param height label高度
 @return 字符串长度
 */
-(CGSize)stringWidthWithFontSize:(CGFloat)fontSize andHeight:(CGFloat)height;


/**
 计算字符串高度

 @param fontSize 字体大小
 @param width label宽度
 @return 字符串高度
 */
-(CGSize)stringheightWithFontSize:(CGFloat)fontSize andWidth:(CGFloat)width;

#pragma mark -------- 时间相关

/**
 获取当前时间

 @param format "yyyy-MM--dd HH:mm:ss"
 @return 当前时间字符串
 */
+(NSString*)getCurrentTimes:(NSString *)format;


/**
 比较时间大小

 @param aDate date a
 @param bDate date b
 @return (=0（相等） =1(a>b) =-1(a < b))
 */
+ (NSInteger)compareDate:(NSString*)aDate withDate:(NSString*)bDate;

@end
