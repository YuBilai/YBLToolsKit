//
//  UIView+YBLViewExtension.m
//  YBLToolsKit
//
//  Created by 康美通 on 2018/10/19.
//  Copyright © 2018年 康美通. All rights reserved.
//

#import "UIView+YBLViewExtension.h"

@implementation UIView (YBLViewExtension)

+ (instancetype)initWithFrame:(CGRect)frame backGroundColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius isShowBoader:(BOOL)isShow{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = false;
    if(isShow){view.layer.borderWidth = 1;view.layer.borderColor = UIColor.grayColor.CGColor;}
    return view;
}


- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.bounds.size.width;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.bounds.size.height;
    
}

- (CGFloat)width
{
    return self.bounds.size.width;
}

- (CGFloat)height
{
    return self.bounds.size.height;
}

- (void)setLeft:(CGFloat)left
{
    CGRect rect = self.frame;
    rect.origin.x = left;
    self.frame = rect;
}

- (void)setRight:(CGFloat)right
{
    CGRect rect = self.frame;
    rect.origin.x = right - self.frame.size.width;
    self.frame = rect;
}

- (void)setTop:(CGFloat)top
{
    CGRect rect = self.frame;
    rect.origin.y = top;
    self.frame = rect;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect rect = self.frame;
    rect.origin.y = bottom - self.frame.size.height;
    self.frame = rect;
}

- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)centerToParentX: (UIView*)view
{
    CGRect rect = self.frame;
    CGFloat yy = view.bounds.size.width;
    rect.origin.x = (yy - rect.size.width) / 2.f;
    self.frame = rect;
}

- (void)centerToParentY: (UIView*)view
{
    CGRect rect = self.frame;
    rect.origin.y = (view.bounds.size.height - rect.size.height) / 2.f;
    self.frame = rect;
}

- (void)centerToParentY:(UIView *)view withOffset:(CGFloat)offset
{
    CGRect rect = self.frame;
    rect.origin.y = (view.bounds.size.height - rect.size.height) / 2 + offset;
    self.frame = rect;
}

- (void)centerToParent:(UIView *)view
{
    CGRect rect = self.frame;
    rect.origin.x = (view.bounds.size.width - rect.size.width) / 2.f;
    rect.origin.y = (view.bounds.size.height - rect.size.height) / 2.f;
    self.frame = rect;
}

- (void)centerAlign: (UIView*)view
{
    CGRect rect = self.frame;
    rect.origin.x = view.frame.origin.x + (view.bounds.size.width-rect.size.width) / 2.f;
    rect.origin.y = view.frame.origin.y + (view.bounds.size.height-rect.size.height) / 2.f;
    self.frame = rect;
}

- (void)centerAlignX: (UIView*)view
{
    CGRect rect = self.frame;
    rect.origin.x = view.frame.origin.x + (view.bounds.size.width-rect.size.width) / 2.f;
    self.frame = rect;
}

- (void)centerAlignY:(UIView *)view
{
    CGRect rect = self.frame;
    rect.origin.y = view.frame.origin.y + (view.bounds.size.height-rect.size.height) / 2.f;
    self.frame = rect;
}

- (BOOL)nearTo: (CGPoint)point lag: (CGFloat)lag
{
    CGRect frame = self.frame;
    frame.origin.x -= lag;
    frame.origin.y -= lag;
    frame.size.width += lag * 2;
    frame.size.height += lag * 2;
    return CGRectContainsPoint(frame, point);
}

- (UIImage*)toUIImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return retImage;
}

//View宽度重新设置
- (void)setViewWidth:(CGFloat)width{
    CGRect rect=self.frame;
    rect.size.width=width;
    self.frame=rect;
}

//View高度设置
-(void)setViewHeight:(CGFloat)height{
    CGRect rect=self.frame;
    rect.size.height=height;
    self.frame=rect;
}

//View x坐标设置
- (void)setViewPointX:(CGFloat)pointX{
    CGRect rect=self.frame;
    rect.origin.x=pointX;
    self.frame=rect;
}

//View y坐标设置
- (void)setViewPointY:(CGFloat)pointY{
    CGRect rect=self.frame;
    rect.origin.y=pointY;
    self.frame=rect;
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

//上
- (void)addTopRoundRadius:(CGFloat)radius
{
    UIBezierPath * _aPath = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radius,radius)];
    CAShapeLayer * _shapeLayer = [[CAShapeLayer alloc]init];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.path = _aPath.CGPath;
    self.layer.mask = _shapeLayer;
}
//下
- (void)addBottomRoundRadius:(CGFloat)radius
{
    UIBezierPath * _aPath = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake( radius , radius)];
    CAShapeLayer * _shapeLayer = [[CAShapeLayer alloc]init];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.path = _aPath.CGPath;
    self.layer.mask = _shapeLayer;
}
//左边
- (void)addLeftRoundRadius:(CGFloat)radius
{
    UIBezierPath * _aPath = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft cornerRadii:CGSizeMake( radius ,radius)];
    CAShapeLayer * _shapeLayer = [[CAShapeLayer alloc]init];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.path = _aPath.CGPath;
    self.layer.mask = _shapeLayer;
}
//右边
- (void)addRightRoundRadius:(CGFloat)radius
{
    UIBezierPath * _aPath = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake( radius , radius)];
    CAShapeLayer * _shapeLayer = [[CAShapeLayer alloc]init];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.path = _aPath.CGPath;
    self.layer.mask = _shapeLayer;
}
//四边
- (void)addCornerRadius:(CGFloat)radius
{
    UIBezierPath * _aPath = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight |UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake( radius , radius)];
    CAShapeLayer * _shapeLayer = [[CAShapeLayer alloc]init];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.path = _aPath.CGPath;
    self.layer.mask = _shapeLayer;
}
- (void)removeAllSubView
{
    for (UIView * subView in [self subviews])
    {
        [subView removeFromSuperview];
    }
}

-(void)executeRunloop:(void (^)(void))runloop afterDelay:(float)delay{
    double delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (runloop) {
            runloop();
        }
    });
}
- (void)presentAnimation
{
    self.top = kScreenHeight;
    [UIView animateWithDuration: 0.4f animations:^{
        self.top = 0;
    }];
}
- (void)dimissAnimaiton
{
    //    self.top = 0;
    [UIView animateWithDuration: 0.4f animations:^{
        self.top = kScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)pushAnimation
{
    self.left = kScreenHeight;
    [UIView animateWithDuration: 0.4f animations:^{
        self.left = 0;
    }];
}
- (void)popAnimation
{
    self.left = 0;
    [UIView animateWithDuration: 0.4f animations:^{
        self.left = kScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)showAnimation
{
    self.alpha = 0;
    [UIView animateWithDuration: 0.4f animations:^{
        self.alpha = 1.f;
    }];
}
- (void)hideAnimation
{
    self.alpha = 1.f;
    [UIView  animateWithDuration: 0.4f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)windowPresent
{
    [[UIApplication sharedApplication].delegate.window endEditing:true];
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    self.top = kScreenHeight;
    [UIView animateWithDuration: 0.4f animations:^{
        self.top = 0;
    }];
}
//从下到上运动（根据自身高度 紧贴父视图底部）
- (void)parentBottomPresent
{
    self.top = kScreenHeight;
    [UIView animateWithDuration: 0.4f animations:^{
        self.top = kScreenHeight - self.height;
    }];
}

+(UIView *)drawLineView:(CGFloat)speace{
    UIView *view = [[UIView alloc]initWithFrame:Rect(speace, 0, kScreenWidth - speace * 2, 0.5)];
    view.backgroundColor = RGB(204,204,204);
    return view;
}

+(UIView *)drawVerticalLineView:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = RGB(204,204,204);
    return view;
}

- (UIView *)findViewThatIsFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findViewThatIsFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}

+ (void)drawDashLineInView:(UIView *)superView startPoint:(CGPoint)startP endPoint:(CGPoint)endP {
    CAShapeLayer *dotLayer = [CAShapeLayer layer];
    
    // 设置填充,绘制的颜色 线宽  拼接处的连接样式
    [dotLayer setFillColor:[[UIColor clearColor] CGColor]];
    [dotLayer setStrokeColor:[[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0f] CGColor]];
    [dotLayer setLineWidth:1.0f];
    [dotLayer setLineJoin:kCALineJoinRound];
    
    // lineWidth=每个短线的长度 lineSpace=每两条短线的间距
    int lineWidth = 10;
    int lineSpace = 5;
    [dotLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineWidth],[NSNumber numberWithInt:lineSpace],nil]];
    
    //设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startP.x, startP.y);
    CGPathAddLineToPoint(path, NULL, endP.x,endP.y);
    [dotLayer setPath:path];
    
    CGPathRelease(path);
    [superView.layer addSublayer:dotLayer];
}

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

@end
