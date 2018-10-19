//
//  UIColor+ColorUtils.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/19.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorUtils)

/**
 IOS中十六进制的颜色转换为UIColor

 @param hexColor 16进制颜色
 @return UIcolor
 */
+ (UIColor *) colorWithHexString: (NSString *)hexColor;


@end
