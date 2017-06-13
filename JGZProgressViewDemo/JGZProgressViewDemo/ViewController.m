//
//  ViewController.m
//  JGZProgressViewDemo
//
//  Created by 江贵铸 on 2017/6/12.
//  Copyright © 2017年 江贵铸. All rights reserved.
//

#import "ViewController.h"
#import "JGZCircleView.h"
@interface ViewController ()
@property (nonatomic,strong) JGZCircleView *Circle1;
@property (nonatomic,strong) JGZCircleView *Circle2;
@property (nonatomic,strong) JGZCircleView *Circle3;
@property (nonatomic,strong) JGZCircleView *Circle4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JGZCircleView *Circle1 = [JGZCircleView CircleWithFrame:CGRectMake(20, 80, 150, 150) startAngle:135 endAngle:405 lineWidth:3 IsCircleBg:YES];
    self.Circle1 = Circle1;
    Circle1.backgroundColor = [UIColor cyanColor];
     Circle1.capRound = YES;
    [self.view addSubview:Circle1];
    UISlider *Slider1 = [[UISlider alloc] initWithFrame:CGRectMake(20, 250, 150, 10)];
    Slider1.tag = 1;
   
    [Slider1 addTarget:self action:@selector(SliderChanger:) forControlEvents:UIControlEventValueChanged];
     [self.view addSubview:Slider1];
    
    JGZCircleView *Circle2 = [JGZCircleView CircleWithFrame:CGRectMake(190, 80, 150, 150) startAngle:180 endAngle:360 lineWidth:5 IsCircleBg:YES];
    self.Circle2 = Circle2;
    Circle2.backgroundColor = [UIColor cyanColor];
    Circle2.CircleColor = [UIColor orangeColor];
    Circle2.CircleBgColor = [UIColor yellowColor];
    Circle2.capRound = NO;
    [self.view addSubview:Circle2];
    UISlider *Slider2 = [[UISlider alloc] initWithFrame:CGRectMake(190, 250, 150, 10)];
    Slider2.tag = 2;
    [Slider2 addTarget:self action:@selector(SliderChanger:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:Slider2];
    
    JGZCircleView *Circle3 = [JGZCircleView CircleWithFrame:CGRectMake(20, 300, 150, 150) startAngle:135 endAngle:405 lineWidth:5 IsCircleBg:NO];
    self.Circle3 = Circle3;
    Circle3.backgroundColor = [UIColor cyanColor];
     Circle3.capRound = YES;
    [self.view addSubview:Circle3];
    UISlider *Slider3 = [[UISlider alloc] initWithFrame:CGRectMake(20, 470, 150, 10)];
    Slider3.tag = 3;
    [Slider3 addTarget:self action:@selector(SliderChanger:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:Slider3];
    
    JGZCircleView *Circle4 = [JGZCircleView CircleWithFrame:CGRectMake(190, 300, 150, 150) startAngle:180 endAngle:360 lineWidth:3 IsCircleBg:NO];
    self.Circle4 = Circle4;
    Circle4.backgroundColor = [UIColor cyanColor];
    Circle4.CircleColor = [UIColor brownColor];
    Circle4.capRound = NO;
    [self.view addSubview:Circle4];
    UISlider *Slider4 = [[UISlider alloc] initWithFrame:CGRectMake(190, 470, 150, 10)];
    Slider4.tag = 4;
    [Slider4 addTarget:self action:@selector(SliderChanger:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:Slider4];
}

-(void)SliderChanger:(UISlider *)Slider{
    switch (Slider.tag) {
        case 1:
            [self.Circle1 setProgress:Slider.value];
            break;
        case 2:
            [self.Circle2 setProgress:Slider.value];
            break;
        case 3:
            [self.Circle3 setProgress:Slider.value];
            break;
        case 4:
            [self.Circle4 setProgress:Slider.value];
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
