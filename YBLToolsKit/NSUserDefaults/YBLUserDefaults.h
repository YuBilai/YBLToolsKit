//
//  YBLUserDefaults.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBLUserDefaults : NSObject
+ (void)saveBool:(BOOL)value forKey:(NSString *)key;
+ (void)saveStringObject:(id)value forKey:(NSString *)key;
+ (void)saveArrayObject:(NSArray *)value forKey:(NSString *)key;
+ (void)saveDictionary:(NSDictionary *)value forKey:(NSString *)key;
+ (BOOL)boolValueForKey:(NSString *)key;
+ (NSString *)stringValueForKey:(NSString *)key;
+ (NSArray *)arrayValueForKey:(NSString *)key;
+ (NSDictionary *)dictionaryValueForKey:(NSString *)key;
+ (void)removeObjectForKey:(NSString *)key;

@end
