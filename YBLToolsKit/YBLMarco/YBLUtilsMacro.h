//
//  YBLUtilsMacro.h
//  ExampleDemo
//
//  Created by 康美通 on 2018/9/14.
//  Copyright © 2018年 康美通. All rights reserved.
//

#ifndef YBLUtilsMacro_h
#define YBLUtilsMacro_h

#define WINDOW                              ((AppDelegate *)[UIApplication sharedApplication].delegate).window
#define KEY_WINDOW                           ([[UIApplication sharedApplication] keyWindow])
#define APPLICATION_DELEGATE                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kUserDefaults                        [NSUserDefaults standardUserDefaults]
#define kSharedApplication                   [UIApplication sharedApplication]
#define kBundle                              [NSBundle mainBundle]
#define kMainScreen                          [UIScreen mainScreen]
#define kSelfNavBar                          self.navigationController.navigationBar
#define kSelfTabBar                          self.tabBarController.tabBar
#define kSelfNavBarHeight                    self.navigationController.navigationBar.bounds.size.height
#define kSelfTabBarHeight                    self.tabBarController.tabBar.bounds.size.height
#define kScreenRect                          [[UIScreen mainScreen] bounds]
#define kScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define kNotificationCenter                  [NSNotificationCenter defaultCenter]
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define Image(name)                         [UIImage imageNamed:name]
#define kDATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define kTIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define kFlushPool(p)                        [p drain]; p = [[NSAutoreleasePool alloc] init]
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kIOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define kAPPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kIsiOS7Later                         (IOSVersion >= 7.0)
#define kIsiOS8Later                         (IOSVersion >= 8.0)
#define kIsiOS11Later                         (IOSVersion >= 11.0)
#define kiOSSystemVersion ([[UIDevice currentDevice] systemVersion].floatValue)

#define kVIEW_WIDTH(v)                        v.frame.size.width
#define kVIEW_HEIGHT(v)                       v.frame.size.height
#define kVIEW_X(v)                            v.frame.origin.x
#define kVIEW_Y(v)                            v.frame.origin.y
#define kSIZE_WIDTH(v)                        v.size.width
#define kSIZE_HEIGHT(v)                       v.size.height
#define kORIGIN_X(v)                          v.origin.x
#define kORIGIN_Y(v)                          v.origin.y

#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)
#define IntNumber(i)                        [NSNumber numberWithInt:i]
#define IntegerNumber(i)                    [NSNumber numberWithInteger:i]
#define FloatNumber(f)                      [NSNumber numberWithFloat:f]
#define DoubleNumber(dl)                    [NSNumber numberWithDouble:dl]
#define BoolNumber(b)                       [NSNumber numberWithBool:b]

#define kStringNotEmpty(str)                 (str && (str.length > 0))
#define kArrayNotEmpty(arr)                  (arr && (arr.count > 0))
#define kStringNotEmpty2(str)                 ( ![str isEqual:[NSNull null]])

#define kWINDOW_TABBAVIEWCONTROLLER           ((BaseTabBarController *)(APPLICATION_DELEGATE.window.rootViewController))
#define wSelf(a) __weak typeof(self) a = self;

//字体
#define FONT_NAME_SIZE(_FontName_,_FontSize_)           [UIFont fontWithName:_fontName_ size:_fontSize_]
#define FONTSIZE(_FontSize_)                            [UIFont systemFontOfSize:_FontSize_]
#define FONT_BOLD_SIZE(_FontSize_)                       [UIFont boldSystemFontOfSize: _FontSize_]

/// block self
#define kWeakSelf __weak typeof(self) weakSelf = self
#define kSelfStrong __strong __typeof__(self) strongSelf = weakSelf

//注视
#define _p(a) /**a*/

//打印输出
#ifdef DEBUG
#define YBLLog(...)NSLog(__VA_ARGS__)
#else  //发布状态  关闭LOG功能
#define YBLLog(...)
#endif

//nib
#define kNib(name) [UINib nibWithNibName:name bundle:nil]

//代码简写
#define kAppVersionNumber                        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAppName                                 [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey]
#define kDeviceName                              [[UIDevice currentDevice] name]
#define kDeviceModel                             [[UIDevice currentDevice] systemName]
#define kDeviceVersion                           [[UIDevice currentDevice] systemVersion]
#define kURLFromString(str)                      [NSURL URLWithString:str]
#define StringFormat(str)                       [NSString stringWithFormat:@"%@",str]
#define kFUNCK KMTLog(@"%s",__func__);
#define kUserInforManager [KMTUserInforModel shareUserInforManage]
#define kNSNotificationCenter [NSNotificationCenter defaultCenter]
#define KSELF __weak typeof(self) kself = self;



#endif /* YBLUtilsMacro_h */
