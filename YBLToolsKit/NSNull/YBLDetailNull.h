//
//  YBLDetailNull.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBLDetailNull : NSObject
/**
 *  处理服务器返回的空字符数据(服务器返回数据先处理空字符)
 *
 *  @param json
 *
 *  @return
 */
+ (id)dealNullData:(id)json;

/**
 *  处理字典
 *
 *  @param dic
 *
 *  @return
 */
+ (id)dealNullWithDictionary:(NSMutableDictionary *)dic;

/**
 *  处理数组
 *
 *  @param arr
 *
 *  @return
 */
+ (id)dealNullWithArray:(NSMutableArray *)arr;

/**
 *   处理空字符串
 *
 *  @param string 需要处理的对象
 *
 *  @return 空字符串
 */
+ (NSString *)dealNullValue:(id)string;

/**
 *   处理空字符串
 *
 *  @param string 需要处理的对象
 *
 *  @return 空字符串
 */
+ (BOOL)isNullValue:(id)string;

@end
