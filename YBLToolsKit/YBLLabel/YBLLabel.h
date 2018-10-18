//
//  YBLLabel.h
//  链式编程
//
//  Created by 康美通 on 2018/9/13.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBLLabel : UILabel

-(YBLLabel *(^)(UIColor *color))textColorSet;

-(YBLLabel *(^)(NSString *text))textSet;

-(YBLLabel *(^)(CGRect frame))frameSet;

-(YBLLabel *(^)(UIColor *backgroundColor)) backgroundColorSet;

-(instancetype)initWithSetBlock:(void(^)(YBLLabel *ybl_label))setBlock;

@end
