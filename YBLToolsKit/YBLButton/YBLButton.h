//
//  YBLButton.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/17.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton* btn);
@interface YBLButton : UIButton
#pragma mark -------- init


#pragma mark -------- action
- (void)addAction:(ButtonBlock)block;
- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;
@end
