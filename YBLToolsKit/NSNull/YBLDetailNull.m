//
//  YBLDetailNull.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "YBLDetailNull.h"

@implementation YBLDetailNull

/**
 *  处理服务器返回的空字符数据
 *
 *  @param json
 *
 *  @return
 */
+ (id)dealNullData:(id)json {
    if ([json isKindOfClass:[NSDictionary class]]) {
        return [self dealNullWithDictionary:json];
    }
    else if ([json isKindOfClass:[NSArray class]]) {
        return [self dealNullWithArray:json];
    }
    else if ([json isKindOfClass:[NSNumber class]]) {
        if ([json isKindOfClass:[NSNull class]] || json == nil) {
            json = @(0);
        }
        return json;
    }
    else {
        return [self dealNullValue:json];
    }
    return json;
}

/**
 *  处理字典
 *
 *  @param dic
 *
 *  @return
 */
+ (id)dealNullWithDictionary:(NSMutableDictionary *)dic {
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    NSArray *allKey = [dic allKeys];
    for (NSString *key in allKey) {
        [tempDic setObject:[self dealNullData:dic[key]] forKey:key];
    }
    return tempDic;
}

/**
 *  处理数组
 *
 *  @param arr
 *
 *  @return
 */
+ (id)dealNullWithArray:(NSMutableArray *)arr {
    
    __block NSMutableArray *tempArr = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tempArr addObject:[self dealNullData:obj]];
    }];
    return tempArr;
}

/**
 *   处理空字符串
 *
 *  @param string 需要处理的对象
 *
 *  @return 空字符串
 */
+ (NSString *)dealNullValue:(id)string
{
    NSString *newStr = [NSString stringWithFormat:@"%@",string];
    if ([newStr isKindOfClass:[NSNull class]] ||
        newStr == nil ||
        [newStr isEqualToString:@"(null)"]||
        [newStr isEqualToString:@""] ||
        [newStr isEqualToString:@"null"] ||
        [newStr isEqualToString:@"<null>"]) {
        newStr = @"";
    }
    return newStr;
}

/**
 *   处理空字符串
 *
 *  @param string 需要处理的对象
 *
 *  @return 空字符串
 */
+ (BOOL)isNullValue:(id)string
{
    
    if ([string isKindOfClass:[NSNull class]] ||
        string == nil ||
        [string isEqualToString:@"(null)"]||
        [string isEqualToString:@""] ||
        [string isEqualToString:@"null"] ||
        [string isEqualToString:@"<null>"]) {
        
        return YES;
    }
    return NO;
}


@end
