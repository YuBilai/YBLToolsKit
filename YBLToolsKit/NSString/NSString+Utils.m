//
//  NSString+Utils.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/18.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "NSString+Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Utils)

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
    if(string == nil || [NSString checkEmptyString:string]){
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
    if(string == nil || [NSString checkEmptyString:string]){
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
    if ([NSString checkEmptyString:format]) {
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
        return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    }else{
        return [self sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, 3000)];
    }
}


- (NSString *)md5String {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    return [[NSString stringWithFormat:
             @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}

-(NSString *)AESStringWithAesKey:(NSString *)aesKey{
    NSString *aesString = aesEncryptString(self, aesKey);
    return aesString;
}

- (NSString *)urlInURLEncoding {
    NSString *encodedUrl = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    return encodedUrl;
}

/**
 * 数字转罗马
 */
+ (NSString *)toRoman:(int)num {
    NSString *roman = @"";
    if (num > 0 && num < 100) {
        
        NSArray *pChars = [[NSArray alloc]initWithObjects: @"L", @"X", @"V", @"I",  nil];
        NSArray *pValues = [[NSArray alloc]initWithObjects:@"50",@"10" , @"5", @"1" ,  nil];
        
        
        while (num > 0) {
            if (num >= 90) {
                roman = [roman stringByAppendingString:@"XC"];
                num -= 90;
                continue;
            }
            
            if (num >= [[pValues objectAtIndex:0] intValue]) {
                NSString *string = [NSString stringWithFormat:@"%@",[pChars objectAtIndex:0]];
                roman = [roman stringByAppendingString:string];
                num -= [[pValues objectAtIndex:0] intValue];
                continue;
            }
            if (num >= 40) {
                roman = [roman stringByAppendingString:@"XL"];
                num -= 90;
                continue;
            }
            if (num >= [[pValues objectAtIndex:1] intValue]) {
                int x10 = num /[[pValues objectAtIndex:1] intValue];
                for (int i = 0; i < x10; i++) {
                    
                    NSString *string = [NSString stringWithFormat:@"%@",[pChars objectAtIndex:1]];
                    roman = [roman stringByAppendingString:string];
                    num -= [[pValues objectAtIndex:1] intValue];
                }
                continue;
            }
            if (num >= 9) {
                roman = [roman stringByAppendingString:@"IX"];
                
                num -= 9;
                continue;
            }
            if (num >= [[pValues objectAtIndex:2] intValue]) {
                
                NSString *string = [NSString stringWithFormat:@"%@",[pChars objectAtIndex:2]];
                roman = [roman stringByAppendingString:string];
                num -= [[pValues objectAtIndex:2] intValue];
                continue;
            }
            if (num == 4) {
                roman = [roman stringByAppendingString:@"IV"];
                num = 0;
                continue;
            }
            for (int i = 0; i < num; i++) {
                NSString *string = [NSString stringWithFormat:@"%@",[pChars objectAtIndex:3]];
                roman = [roman stringByAppendingString:string];
                
                num -= [[pValues objectAtIndex:3] intValue];
            }
        }
    } else {
        NSLog(@"数字超出范围！");
    }
    return roman;
}

+(NSString *)arabicNumeralsToChinese:(int)number{
    
    switch (number) {
        case 0:
            return @"零";
            break;
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
        case 5:
            return @"五";
            break;
        case 6:
            return @"六";
            break;
        case 7:
            return @"七";
            break;
        case 8:
            return @"八";
            break;
        case 9:
            return @"九";
            break;
        case 10:
            return @"十";
            break;
        case 11:
            return @"十一";
            break;
        case 12:
            return @"十二";
            break;
        case 100:
            return @"百";
            break;
        case 1000:
            return @"千";
            break;
        case 10000:
            return @"万";
            break;
        case 100000000:
            return @"亿";
            break;
        default:
            return nil;
            break;
    }
}

//将银行卡类型转化为中文
+(NSString *)changeChineseTypeWithCardType:(NSString *)cardType{
    NSString *chineseType;
    if ([cardType isEqualToString:@"DEBIT"]) {
        chineseType = @"储蓄卡";
    }else if ([cardType isEqualToString:@"CREDIT"]){
        chineseType = @"信用卡";
    }else if ([cardType isEqualToString:@"BOTH"]){
        chineseType = @"借贷卡";
    }
    return chineseType;
}

//给一串字符串按每单位长度添加指定的字符
+ (NSString *)appendCharacters:(NSString *)addedStr WithUnitLength:(NSInteger)unitLength inAppendingStr:(NSString *)appendingStr {
    
    NSInteger units = 0;  //定义指定字符串的长度中含有的指定单位长度的个数
    
    //计算指定的字符串按指定的长度可以分为多少段
    NSInteger appendingStrLength = appendingStr.length;
    if (appendingStrLength % unitLength == 0) {
        units = appendingStrLength / unitLength;
    } else {
        units = appendingStrLength / unitLength + 1;
    }
    
    NSString *appededStr = @"";
    if (appendingStrLength % unitLength == 0) {
        for (NSInteger i = 0; i < units; i++) {
            NSString *subStr = [appendingStr substringWithRange:NSMakeRange(i*unitLength, unitLength)];
            appededStr = [appededStr stringByAppendingString:subStr];
            if (i != units - 1) {
                appededStr = [appededStr stringByAppendingString:addedStr];
            }
        }
    } else {
        for (NSInteger i = 0; i < units -1; i++) {
            NSString *subStr = [appendingStr substringWithRange:NSMakeRange(i*unitLength, unitLength)];
            appededStr = [appededStr stringByAppendingString:subStr];
            appededStr = [appededStr stringByAppendingString:addedStr];
        }
        NSString *endStr = [appendingStr substringFromIndex:(units -1) * unitLength];
        appededStr = [appededStr stringByAppendingString:endStr];
    }
    
    return appededStr;
}

//把金额从以分为单位转换为xx元xx角xx分的形式  123分 -> 1.23元
+ (NSString *)convertFenBalanceToYuanJiaoFenWithBalance:(NSString *)balance {
    NSString *balanceStr = nil;
    if (balance) {
        NSInteger yuanBalance = [balance integerValue] / 100;  //元
        NSInteger jiaoBalance = [balance integerValue] /10 %10; //角
        NSInteger fenBalance  = [balance integerValue] % 10;    //分
        
        balanceStr = [NSString stringWithFormat:@"%ld.%ld%ld", yuanBalance, jiaoBalance, fenBalance];
    }
    return balanceStr;
}

//把金额从以元为单位转换为xx分的形式
+ (NSInteger)convertYuanBalanceToFenWithBalance:(NSString *)balance {
    NSInteger yuanBalance = 0, jiaoBalance = 0, fenBalance = 0;
    
    NSUInteger dotLoc =[balance rangeOfString:@"."].location;
    if (dotLoc != NSNotFound) {
        //表示有小数点,
        if (dotLoc == 0) {
            //在第一位
            yuanBalance = 0;
        } else {
            yuanBalance = [[balance substringToIndex:dotLoc] integerValue];
        }
        
        //如果小数点后有2位
        if (dotLoc + 3 == balance.length) {
            jiaoBalance = [[balance substringWithRange:NSMakeRange(dotLoc +1, 1)] integerValue];
            fenBalance  = [[balance substringWithRange:NSMakeRange(dotLoc +2, 1)] integerValue];
        } else if (dotLoc + 2 == balance.length){
            //如果小数点后有1位
            jiaoBalance = [[balance substringWithRange:NSMakeRange(dotLoc +1, 1)] integerValue];
            fenBalance = 0;
        } else if (dotLoc + 1 == balance.length) {
            jiaoBalance = 0;
            fenBalance  = 0;
        }
        
        return yuanBalance * 100 + jiaoBalance * 10 + fenBalance;
        
    } else {
        yuanBalance = [balance integerValue];
        return yuanBalance * 100;
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

//获取*字符串
+ (NSString *)getStarWithStinng:(NSString *)string Range:(NSRange)range{
    string = [string stringByReplacingCharactersInRange:range withString:@"*"];
    return string;
}


@end
