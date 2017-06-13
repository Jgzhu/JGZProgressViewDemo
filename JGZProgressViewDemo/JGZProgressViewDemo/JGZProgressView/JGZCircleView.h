//
//  JGZCircleView.h
//  JGZProgressViewDemo
//
//  Created by 江贵铸 on 2017/6/12.
//  Copyright © 2017年 江贵铸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGZCircleView : UIView
//圆弧颜色
@property (nonatomic,strong) UIColor *CircleColor;
//圆弧背景颜色
@property (nonatomic,strong) UIColor *CircleBgColor;
//是否圆角,默认YES
@property (nonatomic, assign) BOOL capRound;
+(instancetype)CircleWithFrame:(CGRect)frame startAngle:(CGFloat)start
                      endAngle:(CGFloat)end lineWidth:(CGFloat)lineWidth IsCircleBg:(BOOL)IsCircleBg;
-(void)setProgress:(CGFloat)Progress;//0~1之间
@end
