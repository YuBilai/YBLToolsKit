//
//  UIView+YBLViewExtension.h
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/19.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YBLViewExtension)

#pragma mark -------- init
+(instancetype)initWithFrame:(CGRect)frame backGroundColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius isShowBoader:(BOOL)isShow;

#pragma mark -------- frame
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

- (void)centerToParent:(UIView *)view;
- (void)centerToParentX: (UIView*)view;
- (void)centerToParentY: (UIView*)view;
- (void)centerToParentY: (UIView *)view withOffset: (CGFloat)offset;
- (void)centerAlign: (UIView*)view;
- (void)centerAlignX: (UIView*)view;
- (void)centerAlignY:(UIView *)view;
- (BOOL)nearTo: (CGPoint)point lag: (CGFloat)lag;
- (UIImage*)toUIImage;

- (void)setViewWidth:(CGFloat)width;//View宽度重新设置
- (void)setViewHeight:(CGFloat)height;//View高度重新设置
- (void)setViewPointX:(CGFloat)pointX;//View x坐标设置
- (void)setViewPointY:(CGFloat)pointY;//View y坐标设置
- (UIViewController *)viewController;//递归查找view 的ViewController

#pragma mark -------- 圆角添加
- (void)addTopRoundRadius:(CGFloat)radius;//上
- (void)addBottomRoundRadius:(CGFloat)radius;//下
- (void)addLeftRoundRadius:(CGFloat)radius;//左边
- (void)addRightRoundRadius:(CGFloat)radius;//右边
- (void)addCornerRadius:(CGFloat)radius;//四边
- (void)removeAllSubView;//移除view上面的所有控件

#pragma mark -------- 基础动画添加
- (void)executeRunloop:(void (^)(void))runloop afterDelay:(float)delay;
- (void)presentAnimation;//从下到上动画
- (void)dimissAnimaiton;//从上到下动画
- (void)pushAnimation;//从左到右动画
- (void)popAnimation;//从右到左动画
- (void)showAnimation;//渐现动画
- (void)hideAnimation;//渐隐动画
- (void)windowPresent;//从下到上加入window动画
- (void)parentBottomPresent;//从下到上运动（根据自身高度 紧贴父视图底部）

#pragma mark -------- 分割线绘制
+(UIView *)drawLineView:(CGFloat)speace;//横线
+(UIView *)drawVerticalLineView:(CGRect)frame;//竖线
- (UIView *)findViewThatIsFirstResponder;
@end
