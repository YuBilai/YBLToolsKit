//
//  UIViewController+YBLViewControllerUntils.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonActionBlock)(UIButton *button);
@interface UIViewController (YBLViewControllerUntils)
//获取当前窗口的UINavigationController
+(UIViewController *)theTopviewControler;

@end
