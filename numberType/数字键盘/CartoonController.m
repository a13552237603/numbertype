//
//  CartoonController.m
//  数字键盘
//
//  Created by 贺恒涛 on 16/5/16.
//  Copyright © 2016年 贺恒涛. All rights reserved.
//
#define DURATION 0.5f
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)

#define kRadianToDegrees(radian) (radian*180.0)/(M_PI)

#import "CartoonController.h"

@interface CartoonController (){
    NSInteger timeInt;
    CABasicAnimation *animations;
}

@end

@implementation CartoonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view1.hidden = YES;
    self.view2.hidden = YES;
    self.view3.hidden = YES;
    self.view4.hidden = YES;
    self.view5.hidden = YES;

    timeInt = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timeaction:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view from its nib.
}
- (void)timeaction:(NSTimer *)timer{
    ++timeInt;
    if (timeInt == 1) {
        self.view1.hidden = NO;
        [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromTop ForView:self.view1];
    }
    else if (timeInt == 2){
         [self.view1.layer addAnimation:[self moveX:0.5f X:[NSNumber numberWithFloat:50.0f]] forKey:@"xy"];
//         [self.view1.layer addAnimation:[self moveX:0.5f X:[NSNumber numberWithFloat:-50.0f]] forKey:@"xy"];
        
    }
    else if (timeInt == 3){
//        self.view2.hidden = NO;
//        [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromTop ForView:self.view2];

//[self.view1.layer addAnimation:[self moveX:0.5f X:[NSNumber numberWithFloat:50.0f]] forKey:@"xy"];
        [self.view1.layer removeAnimationForKey:@"xy"];

    }else if (timeInt == 4){
//         [self.view1.layer removeAnimationForKey:@"xy"];
 
    }
//    else if (timeInt == 6){
//        self.view3.hidden = NO;
//        [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromTop ForView:self.view3];
//
//    }else if (timeInt == 8){
//        self.view4.hidden = NO;
//        [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromTop ForView:self.view4];
//
//    }else if (timeInt == 10){
//        self.view5.hidden = NO;
//        [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromTop ForView:self.view5];
//
//    }
    else if (timeInt >10){
//        timeInt = 0;
//        self.view1.hidden = YES;
//        self.view2.hidden = YES;
//        self.view3.hidden = YES;
//        self.view4.hidden = YES;
//        self.view5.hidden = YES;
        [timer invalidate];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 上下移动
-(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x
{
    animations = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];///.y的话就向下移动。
    animations.toValue = x;
    animations.duration = time;
    animations.removedOnCompletion = YES;//yes的话，又返回原位置了。
    animations.repeatCount = MAXFLOAT;
    animations.fillMode = kCAFillModeForwards;
    return animations;
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
