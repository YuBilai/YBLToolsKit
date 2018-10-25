//
//  NSTimer+TimerUntils.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/25.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "NSTimer+TimerUntils.h"

@implementation NSTimer (TimerUntils)

+ (void)timerCountDownWith:(NSInteger)time titleChangedButton:(UIButton *)sender {
    __block NSInteger timeout=time; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                // NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"重新发送"];
                // [sender setAttributedTitle:str forState:UIControlStateNormal];
                //[sender setTitleColor:kButtonEnableColor forState:UIControlStateNormal];
                [sender setTitle:@"重新发送" forState:UIControlStateNormal];
                //  [sender setTitleColor:kButtonEnableColor forState:UIControlStateNormal];
                sender.enabled = YES;
            });
        }else{
            NSInteger seconds = timeout % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2ld", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *titleString = [NSString stringWithFormat:@"%@S",strTime];
                //                    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:titleString];
                //                    [str addAttribute:NSForegroundColorAttributeName value:kButtonEnableColor range:NSMakeRange(0,str.length-4)];
                //                     [str addAttribute:NSForegroundColorAttributeName value:kCellTextColor range:NSMakeRange(str.length-4,4)];
                // sender setTitleColor:kCellTextColor forState:<#(UIControlState)#>
                
                [sender setTitle:titleString forState:(UIControlStateNormal)];
                sender.enabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

+(void)dispatchTimerWithTime:(CGFloat)time block:(void (^)(void))block
{
    dispatch_time_t time_t = dispatch_time(DISPATCH_TIME_NOW,(int64_t)(time * NSEC_PER_SEC));
    
    dispatch_after(time_t, dispatch_get_main_queue(), ^{ block(); });
}


@end
