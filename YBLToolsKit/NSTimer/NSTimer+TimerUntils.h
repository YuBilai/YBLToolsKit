//
//  NSTimer+TimerUntils.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (TimerUntils)
// 定时器倒计时(用于倒计时按钮绘制)
+ (void)timerCountDownWith:(NSInteger)time titleChangedButton:(UIButton *)sender;

//延迟GCD
+(void)dispatchTimerWithTime:(CGFloat)time block:(void(^)(void))block;
@end
