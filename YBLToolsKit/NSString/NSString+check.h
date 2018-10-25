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

/**
 *  IP地址有效性
 */
- (BOOL)isIPAddress;

/**
 *  Mac地址有效性
 */
- (BOOL)isMacAddress;

/**
 *  网址有效性
 */
- (BOOL)isValidUrl;

/**
 *  纯汉字
 */
- (BOOL)isValidChinese;

/**
 *  邮政编码
 */
- (BOOL)isValidPostalcode;

/**
 *  工商税号
 */
- (BOOL)isValidTaxNo;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;




#pragma mark -------- 类方法
/**
 身份证号校验

 @param value 身份证号
 @return Y/N
 */
+ (BOOL)verifyIDCardNumber:(NSString *)value;

/**
 *  精确的身份证号码有效性检测
 *
 *  @param value 身份证号
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

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


//校验车牌号
+ (BOOL )validateCarNo:(NSString *)carNo;

//判断输入的时间是否合法
+(BOOL)checkDateIsUsed:(NSString *)dateString;

//是否是中文姓名
+ (BOOL)isVaildRealName:(NSString *)realName;

//输入是否包含拼音
+ (BOOL)isIncludeChineseInString:(NSString*)str;

//限制金额的格式
+ (BOOL)formartInputMoney:(NSString *)inputMoney inputCharacter:(NSString *)inputCharacter;

//是否含空格
+ (BOOL) checkEmptyString:(NSString *) string;

@end
