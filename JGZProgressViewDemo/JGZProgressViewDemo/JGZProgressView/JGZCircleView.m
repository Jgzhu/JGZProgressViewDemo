//
//  JGZCircleView.m
//  JGZProgressViewDemo
//
//  Created by 江贵铸 on 2017/6/12.
//  Copyright © 2017年 江贵铸. All rights reserved.
//

#import "JGZCircleView.h"
#define DEGREES_TO_RADIANS(degrees) ((degrees)*M_PI)/180


@interface JGZCircleView ()
@property (nonatomic, strong) CAShapeLayer *ProgressLayer;//进度
@property (nonatomic, strong) CAShapeLayer *ProgressBgLayer;//进度
@property (strong, nonatomic) UIBezierPath *CircleBezierPath;
@property (assign,nonatomic) CGFloat startAngle;//起点
@property (assign,nonatomic) CGFloat endAngle;//终点
@property (assign,nonatomic) CGFloat lineWidth;//线宽
@property (nonatomic) BOOL IsCircleBg;
@end
@implementation JGZCircleView

+(instancetype)CircleWithFrame:(CGRect)frame startAngle:(CGFloat)start endAngle:(CGFloat)end lineWidth:(CGFloat)lineWidth IsCircleBg:(BOOL)IsCircleBg{
    JGZCircleView *CircleView = [[JGZCircleView alloc] initWithFrame:frame];
    CircleView.startAngle = start;
    CircleView.endAngle = end;
    CircleView.lineWidth= lineWidth;
    CircleView.IsCircleBg = IsCircleBg;
    return CircleView;
}
-(void)CreatCircle:(CGRect)rect{
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5)
                                                         radius:self.IsCircleBg?self.frame.size.width*0.5-self.lineWidth*0.5-3:self.frame.size.width*0.5-self.lineWidth*0.5
                                                     startAngle:DEGREES_TO_RADIANS(self.startAngle)
                                                       endAngle:DEGREES_TO_RADIANS(self.endAngle)
                                                      clockwise:YES];
    self.CircleBezierPath = aPath;
    aPath.lineWidth = self.lineWidth;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    if (self.IsCircleBg) {
        CAShapeLayer  *shapeLayer = [CAShapeLayer layer];
        self.ProgressBgLayer = shapeLayer;
        shapeLayer.frame = rect;
        shapeLayer.lineCap = self.capRound?kCALineCapRound:kCALineCapButt;
        shapeLayer.path = self.CircleBezierPath.CGPath;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = self.lineWidth+6;
        shapeLayer.strokeColor =self.CircleBgColor?self.CircleBgColor.CGColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.000].CGColor;
        [self.layer addSublayer:shapeLayer];
    }
    CAShapeLayer  *shapeLayer = [CAShapeLayer layer];
    self.ProgressLayer = shapeLayer;
    shapeLayer.frame = rect;
    shapeLayer.lineCap = self.capRound?kCALineCapRound:kCALineCapButt;
    shapeLayer.path = self.CircleBezierPath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = self.lineWidth;
    shapeLayer.strokeColor = self.CircleColor?self.CircleColor.CGColor:[UIColor colorWithRed:0.906 green:0.769 blue:0.125 alpha:1.000].CGColor;
    [self.layer addSublayer:shapeLayer];
    [self startAnimationValue:0.0];
   
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self CreatCircle:rect];
}

- (void)startAnimationValue:(CGFloat)value{
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 1.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:value];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [self.ProgressLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}
#pragma mark##setter方法##
-(void)setCircleColor:(UIColor *)CircleColor{
    _CircleColor=CircleColor;
    //self.ProgressLayer.strokeColor = CircleColor.CGColor;
    [self setNeedsLayout];
}

-(void)setCircleBgColor:(UIColor *)CircleBgColor{
    _CircleBgColor=CircleBgColor;
    //self.ProgressBgLayer.strokeColor = CircleBgColor.CGColor;
    [self setNeedsLayout];
}
-(void)setCapRound:(BOOL)capRound{
    _capRound=capRound;
    [self setNeedsLayout];
    //self.ProgressLayer.lineCap =capRound?kCALineCapRound:kCALineCapButt;
    //self.ProgressBgLayer.lineCap =capRound?kCALineCapRound:kCALineCapButt;
}
-(void)setProgress:(CGFloat)Progress{
    [self startAnimationValue:Progress];
}
@end
