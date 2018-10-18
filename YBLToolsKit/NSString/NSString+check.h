//
//  NSString+check.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/18.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (check)

#pragma mark -------- 属性方法
/**
 字符串判断是否为空

 @return Y/N
 */
- (BOOL)checkEmpty;


/**
 手机号码校验

 @return Y/N
 */
-(BOOL)checkMobileNumber;


/**
 邮箱校验

 @return Y/N
 */
- (BOOL)isValidateEmail;



/**
 检测是否是中文、英文和数字

 @return Y/N
 */
- (BOOL)stringShouldAcceptable;


/**
 判断字符串是否是电话号码

 @return Y/N
 */
- (BOOL)isMobileOrTelphoneNumber;



#pragma mark -------- 类方法




/**
 身份证号校验

 @param value 身份证号
 @return Y/N
 */
+ (BOOL)verifyIDCardNumber:(NSString *)value;

/**
 银行卡号校验

 @param cardNum 被检字符串
 @return Y/N
 */
+ (BOOL)isBankCardNumber:(NSString *)cardNum;


/**
 luhn算法校验银行卡号

 @param cardNum 银行卡号码
 @return Y/N
 */
+ (BOOL)luhnCheckBankCardNum:(NSString *)cardNum;


/**
 检测字符串包含的表情字符

 @param string 被检测字符串
 @return  表情字符
 */
+ (NSString *)stringContainsEmoji:(NSString *)string;





@end
