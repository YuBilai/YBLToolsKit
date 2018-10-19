//
//  UIColor+ColorUtils.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/19.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "UIColor+ColorUtils.h"

@implementation UIColor (ColorUtils)
+ (UIColor *) colorWithHexString: (NSString *)hexColor
{
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // Separate into r, g, b substrings
    unsigned int red,green,blue;
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    [[NSScanner scannerWithString:[cString substringWithRange:range]] scanHexInt:&red];
    //g
    range.location = 2;
    [[NSScanner scannerWithString:[cString substringWithRange:range]] scanHexInt:&green];
    //b
    range.location = 4;
    [[NSScanner scannerWithString:[cString substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}
@end
