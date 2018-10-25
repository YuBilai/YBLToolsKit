//
//  NSDictionary+DictionaryUtils.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DictionaryUtils)
// 将字典类型的参数转换为发送get请求时所需的拼接字符串
- (NSString *)stringFromDictionaryParameters;

- (NSString *)jsonString: (NSString *)key;
- (NSDictionary *)jsonDict: (NSString *)key;
- (NSArray *)jsonArray: (NSString *)key;

// 判断该数组中的每个对象是否都是字符串
- (NSArray *)jsonStringArray: (NSString *)key;

// 常规类型
- (BOOL)jsonBool: (NSString *)key;
- (NSInteger)jsonInteger: (NSString *)key;
- (long long)jsonLongLong: (NSString *)key;
- (unsigned long long)jsonUnsignedLongLong:(NSString *)key;
- (double)jsonDouble: (NSString *)key;

//字典转json
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
//安全转换类型
+(NSDictionary *)safeDictionaryWithDic:(NSDictionary *)dic;

@end
