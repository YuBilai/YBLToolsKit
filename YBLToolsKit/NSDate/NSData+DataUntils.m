//
//  NSData+DataUntils.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "NSData+DataUntils.h"

@implementation NSDate (DataUntils)
+ (NSString *)getTimeStamp{
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970] * 1000];
    return timeSp;
}

-(NSString *)getCurrentTime:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:format];
    
    NSDate *datenow = [NSDate date];

    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    YBLLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
}

+ (NSString *)getDateTimeInterval:(NSTimeInterval)time Format:(NSString *)format isMS:(BOOL)ms
{
    if (ms) {
        time = time/1000;
    }
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle: NSDateFormatterMediumStyle];
    [formatter setTimeStyle: NSDateFormatterShortStyle];
    [formatter setDateFormat: format]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制v1296035591 为秒
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970: time];
    return [formatter stringFromDate:confromTimesp];
}
@end
