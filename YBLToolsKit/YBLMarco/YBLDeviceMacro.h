//
//  YBLDeviceMacro.h
//  ExampleDemo
//
//  Created by 康美通 on 2018/9/14.
//  Copyright © 2018年 康美通. All rights reserved.
//

#ifndef YBLDeviceMacro_h
#define YBLDeviceMacro_h

#pragma mark - 设备屏幕尺寸
#define kMainScreenSize      ([[UIScreen mainScreen] bounds].size)
#define kMainScreenWidth     ([[UIScreen mainScreen] bounds].size.width)
#define kMainScreenHeight    ([[UIScreen mainScreen] bounds].size.height)

#define SafeAreaTopHeight    (kMainScreenHeight == 812.0 ? 88 : 64)


#pragma mark - 设备系统版本
#define iOSSystemVersion ([[UIDevice currentDevice] systemVersion].floatValue)
#define iOS7             ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0)

#pragma mark - 应用版本号
#define AppVersion ([[[NSBundle mainBundle] infoDictionary]      objectForKey:@"CFBundleShortVersionString"])

#pragma mark - 设备型号
#define iPhone4   (([UIScreen mainScreen].currentMode.size.height) == 960 ? YES:NO)
#define iPhone5   (([UIScreen mainScreen].currentMode.size.height) == 1136? YES:NO)
#define iPhone6   (([UIScreen mainScreen].currentMode.size.height) == 1334? YES:NO)
#define iPhone6p  (([UIScreen mainScreen].currentMode.size.height) == 2208? YES:NO)
#define iPhoneX   ([[UIScreen mainScreen] bounds].size.height ==812? YES:NO)
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#pragma mark - 设备坐标相关
#define iphone5Width 320.0
#define iphone5Height 568.0
#define kviewX(a) (a).frame.origin.x
#define kviewY(a) (a).frame.origin.y
#define kviewWidth(a) (a).frame.size.width
#define kviewHeight(a) (a).frame.size.height

#pragma mark - 导航栏和TabBar
///状态栏高度
#define UI_STATUS_BAR_HEIGHT                    (UI_IS_IPHONEX ? 44.0 : 20.0)
///导航栏高度
#define UI_NAVIGATION_BAR_HEIGHT                (44)
///状态栏+导航栏高度
#define UI_NAVIGATION_BAR_STATUS_BAR_HEIGHT     (UI_STATUS_BAR_HEIGHT + UI_NAVIGATION_BAR_HEIGHT)
///底部安全距离
#define UI_TAB_BOTTOM_SAFE_PADDING              (UI_IS_IPHONEX ? 34.0 : 0.0)
///TabBar高度
#define UI_TAB_BAR_HEIGHT                       (UI_TAB_BOTTOM_SAFE_PADDING + 49.0)
///iphoneX的偏移
#define UI_STATUS_BAR_IphoneX_PADDING

#endif /* YBLDeviceMacro_h */
