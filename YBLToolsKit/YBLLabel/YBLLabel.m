//
//  YBLLabel.m
//  链式编程
//
//  Created by 康美通 on 2018/9/13.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "YBLLabel.h"

@interface YBLLabel()



@end

@implementation YBLLabel

-(instancetype)init{
    if (self == [super init]) {
        
    }
    return self;
}

-(instancetype)initWithSetBlock:(void (^)(YBLLabel *))setBlock{
    if (self == [super init]) {
        setBlock(self);
    }
    return self;
}

-(YBLLabel *(^)(NSString *))textSet{
    YBLLabel *(^textBlock)(NSString *) = ^(NSString * text){
        self.text = text;
        return self;
    };
    return textBlock;
}

-(YBLLabel *(^)(UIColor *))textColorSet{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

-(YBLLabel *(^)(CGRect))frameSet{
    return ^(CGRect frame) {
        self.frame = frame;
        return self;
    };
}

-(YBLLabel *(^)(UIColor *))backgroundColorSet{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

-(void)dealloc{
    
}

@end
