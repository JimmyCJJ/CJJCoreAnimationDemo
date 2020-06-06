//
//  CJJCAAnimationGroup.m
//  CJJCoreAnimationDemo
//  github:https://github.com/JimmyCJJ
//  Created by JimmyCJJ on 2020/1/8.
//  Copyright © 2020 JimmyCJJ. All rights reserved.
//

#import "CJJCAAnimationGroup.h"

@implementation CJJCAAnimationGroup

- (void)addAnimationForView:(UIView *)view
{
    NSLog(@"测试动画组");
    [self animationAroundWithView:view];
}

//中心向四周扩散动画
- (void)animationAroundWithView:(UIView *)view
{
    CGFloat width = view.frame.size.width;
    CGFloat height = view.frame.size.height;
    CALayer *animationLayer = [CALayer layer];
    animationLayer.frame = CGRectMake(width * 0.3, height * 0.3, width * 0.4, height * 0.4);
    NSInteger count = 5;
    double duration = 5;
    
    for (int i = 0; i < count; i++) {
        //动画1:放缩
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        basicAnimation.fromValue = @0.5;
        basicAnimation.toValue = @3.0;
        
        //动画2:帧动画
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        keyAnimation.values = @[@1,@0.9,@0.8,@0.7,@0.6,@0.5,@0.4,@0.3,@0.2,@0.1,@0.0];
        keyAnimation.keyTimes = @[@0,@0.1,@0.2,@0.3,@0.4,@0.5,@0.6,@0.7,@0.8,@0.9,@1.0];
        
        CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        //初始化一个动画组
        CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
        //设置相关属性
        groupAnimation.fillMode = kCAFillModeForwards;
        //设置动画开始时间
        groupAnimation.beginTime = CACurrentMediaTime()+(double)i*duration/(double)count;
        //设置动画持续时间
        groupAnimation.duration = duration;
        groupAnimation.repeatCount = HUGE_VAL;
        groupAnimation.timingFunction = defaultCurve;
        groupAnimation.removedOnCompletion = NO;
        //添加刚刚已经准备好的两个动画
        groupAnimation.animations = @[basicAnimation,keyAnimation];
        //将动画组添加到layer中去
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = [UIColor orangeColor].CGColor;
        layer.frame = CGRectMake(0, 0, width * 0.4, height * 0.4);
        layer.borderColor = [UIColor orangeColor].CGColor;
        layer.borderWidth = 1.0f;
        layer.cornerRadius = height * 0.2f;
        layer.opacity = 0.0f;
        [layer addAnimation:groupAnimation forKey:@"layer"];
        [animationLayer addSublayer:layer];
    }
    [view.layer addSublayer:animationLayer];

    //动画3:滚动
    CABasicAnimation *transitionAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    transitionAnimation.fromValue = @0.5;
    transitionAnimation.toValue = @3.0;
    transitionAnimation.duration = 5;
    
    //动画4:移动
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 450)];
    positionAnimation.beginTime = 0;
    positionAnimation.duration = 5;
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    
    //动画5:反向移动
    CABasicAnimation *positionAnimation1 = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation1.toValue = [NSValue valueWithCGPoint:CGPointMake(350, 150)];
    positionAnimation1.duration = 5;
    positionAnimation1.beginTime = 5;
    positionAnimation1.fillMode = kCAFillModeForwards;
    positionAnimation1.removedOnCompletion = NO;
    
    //动画6:反向移动
    CABasicAnimation *positionAnimation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation2.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 600)];
    positionAnimation2.duration = 10;
    positionAnimation2.beginTime = 10;
    positionAnimation2.fillMode = kCAFillModeForwards;
    positionAnimation2.removedOnCompletion = NO;
    
    //合成以上6种动画效果
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 20.0;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[transitionAnimation,positionAnimation,positionAnimation1,positionAnimation2];
    [view.layer addAnimation:group forKey:nil];
    
}

@end
