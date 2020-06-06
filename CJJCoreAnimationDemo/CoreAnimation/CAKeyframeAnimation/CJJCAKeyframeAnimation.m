//
//  CJJCAKeyframeAnimation.m
//  CJJCoreAnimationDemo
//  github:https://github.com/JimmyCJJ
//  Created by JimmyCJJ on 2020/1/8.
//  Copyright © 2020 JimmyCJJ. All rights reserved.
//

#import "CJJCAKeyframeAnimation.h"

@implementation CJJCAKeyframeAnimation

- (void)addAnimationForView:(UIView *)view
{
    NSLog(@"测试关键帧动画");
    [self animationAlert:view];
}

//弹窗效果
- (void)animationAlert:(UIView *)view
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.6;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:popAnimation forKey:nil];
    
}

@end
