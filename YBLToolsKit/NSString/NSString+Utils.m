//
//  NSString+Utils.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/18.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)
//字符串去空格
-(NSString *)stringTrimWhitespace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)securePhoneNumber{
    NSString *regular=@"(?<=\\d{4})\\d(?=\\d{4})";
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regular options:0 error:nil];
    NSString *content=self;
    content  = [regularExpression stringByReplacingMatchesInString:content options:0 range:NSMakeRange(0, content.length) withTemplate:@"*"];
    return content;
}

- (NSString *)secureLastFourCount:(NSString *)string{
    NSString *regular=@"(\\d(?=\\d{4}))";
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regular options:0 error:nil];
    string  = [regularExpression stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@"*"];
    return string;
}

-(NSString *)secureBankCardNumber{
    NSString *regular=@"(?<=\\d{4})\\d(?=\\d{4})";
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regular options:0 error:nil];
    NSString *content=self;
    content  = [regularExpression stringByReplacingMatchesInString:content options:0 range:NSMakeRange(0, content.length) withTemplate:@"*"];
    content = [self formatterBankCardNum:content];
    return content;
}

-(NSString *)secureIDCardNumber{
    NSString *regular=@"(?<=\\d{6})\\d(?=\\d{0})";
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regular options:0 error:nil];
    NSString *content=self;
    content  = [regularExpression stringByReplacingMatchesInString:content options:0 range:NSMakeRange(0, content.length) withTemplate:@"*"];
    return content;
}

+(NSString *)formatBrushAmount:(NSString *)string{
    if(string == nil || [string checkEmpty]){
        return @"￥0.00";
    }
    if(string.length == 1){
        return [NSString stringWithFormat:@"￥0.0%@",string];
    }
    NSString *oneAmount = [string substringWithRange:NSMakeRange(0, string.length -2)];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle =kCFNumberFormatterCurrencyStyle;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithUnsignedInteger:[oneAmount intValue]]];
    newAmount = [NSString stringWithFormat:@"%@.%@",[newAmount componentsSeparatedByString:@"."][0],[string substringWithRange:NSMakeRange(string.length -2,2)]];
    return newAmount;
}

+ (NSString *)formatAmount:(NSString *)string {
    if(string == nil || [string checkEmpty]){
        return @"0.00";
    }
    if(string.length == 1){
        return [NSString stringWithFormat:@"0.0%@",string];
    }
    
    NSString *oneAmount = nil;
    if ([[string substringToIndex:1] isEqualToString:@"-"]) {
        oneAmount = [string substringWithRange:NSMakeRange(1, string.length -3)];
    }else {
        oneAmount = [string substringWithRange:NSMakeRange(0, string.length -2)];
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle =kCFNumberFormatterCurrencyStyle;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithUnsignedInteger:[oneAmount intValue]]];
    newAmount = [newAmount substringFromIndex:1];
    newAmount = [NSString stringWithFormat:@"%@.%@",[newAmount componentsSeparatedByString:@"."][0],[string substringWithRange:NSMakeRange(string.length -2,2)]];
    if ([[string substringToIndex:1] isEqualToString:@"-"]) {
        newAmount = [NSString stringWithFormat:@"-%@",newAmount];
    }
    return newAmount;
}

+ (NSString *)stringWithFormatAmount:(double)amount{
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    numFormatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    
    NSString *priceStr = [numFormatter stringFromNumber:[NSNumber numberWithDouble:amount]];
    return priceStr;
}

+(NSString *)formatCardNumber:(NSString *)string{
    NSMutableString *cardString = [[NSMutableString alloc]init];
    NSInteger count = string.length;
    NSInteger index = 0;
    while (count>4) {
        [cardString appendString:[string substringWithRange:NSMakeRange(index, 4)]];
        [cardString appendString:@" "];
        index = index + 4;
        count = count - 4;
    }
    
    if(count > 0){
        [cardString appendString:@" "];
        [cardString appendString:[string substringWithRange:NSMakeRange(index,string.length - index)]];
    }
    
    return cardString;
    
}


+(NSString *)stringDeleteWhiteSpaceWithString:(NSString *)string{
    return  [string stringByReplacingOccurrencesOfString:@" " withString:@""];;
}

+(float)getIntegerNimberWithString:(NSString *)string{
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    float num;
    [scanner scanFloat:&num];
    return num;
}


+(NSString*)getCurrentTimes:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (format.checkEmpty) {
        format = @"YYYY-MM-dd";
    }
    [formatter setDateFormat:format];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+ (NSInteger)compareDate:(NSString*)aDate withDate:(NSString*)bDate
{
    NSInteger aa;
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *dta = [[NSDate alloc] init];
    NSDate *dtb = [[NSDate alloc] init];
    
    dta = [dateformater dateFromString:aDate];
    dtb = [dateformater dateFromString:bDate];
    NSComparisonResult result = [dta compare:dtb];
    if (result == NSOrderedAscending)
    {
        aa=1;
    }else {
        aa=-1;
    }
    return aa;
}

- (CGSize)stringWidthWithFont:(CGFloat)fontSize andText:(NSString *)text{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize size=[text sizeWithAttributes:attrs];
    return size;
}

- (CGSize)stringWidthWithFontSize:(CGFloat)fontSize andHeight:(CGFloat)height{
    if ([UIDevice currentDevice].systemVersion.floatValue>7.0) {
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
        return [self boundingRectWithSize:CGSizeMake(kScreenWidth, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    }else{
        return [self sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(kScreenWidth, height)];
    }
}

-(CGSize)stringheightWithFontSize:(CGFloat)fontSize andWidth:(CGFloat)width{
    if ([UIDevice currentDevice].systemVersion.floatValue>7.0) {
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
        return [self boundingRectWithSize:CGSizeMake(width, 3000) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    }else{
        return [self sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, 3000)];
    }
}


#pragma mark -------- private
-(NSString *)formatterBankCardNum:(NSString *)string
{
    NSString *tempStr=string;
    NSInteger size =(tempStr.length / 4);
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    for (int n = 0;n < size; n++)
    {
        [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(n*4, 4)]];
    }
    [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(size*4, (tempStr.length % 4))]];
    tempStr = [tmpStrArr componentsJoinedByString:@" "];
    return tempStr;
}



@end
