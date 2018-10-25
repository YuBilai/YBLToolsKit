//
//  NSData+DataUntils.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DataUntils)
/**
 获取当前时间戳
 
 @return 时间戳字符串
 */
+ (NSString *)getTimeStamp;


/**
 按指定格式获取当前时间

 @param format 格式 yyyy-MM-dd hh:mm:ss
 @return 时间字符串
 */
-(NSString *)getCurrentTime:(NSString *)format;


/**
 按指定格式获取当前时间

 @param time 时间戳
 @param format 指定格式
 @param ms 是否是毫秒
 @return 格式时间字符串
 */
+ (NSString *)getDateTimeInterval:(NSTimeInterval)time Format:(NSString *)format isMS:(BOOL)ms;
@end
