//
//  CJJCASpringAnimation.m
//  CJJCoreAnimationDemo
//  github:https://github.com/JimmyCJJ
//  Created by JimmyCJJ on 2020/1/8.
//  Copyright © 2020 JimmyCJJ. All rights reserved.
//

#import "CJJCASpringAnimation.h"

@implementation CJJCASpringAnimation

- (void)addAnimationForView:(UIView *)view
{
    NSLog(@"测试弹簧动画");
    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"position.y"];
    springAnimation.mass = 1;
    springAnimation.stiffness = 100;
    springAnimation.damping = 1;
    springAnimation.initialVelocity = 0;
    springAnimation.duration = springAnimation.settlingDuration;
    springAnimation.fromValue = @(view.center.y);
    springAnimation.toValue = @(view.center.y + 150);
    springAnimation.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:springAnimation forKey:nil];
}

@end
