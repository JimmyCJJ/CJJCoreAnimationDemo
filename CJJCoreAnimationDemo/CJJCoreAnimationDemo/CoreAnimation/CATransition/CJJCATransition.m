//
//  CJJCATransition.m
//  CJJCoreAnimationDemo
//  github:https://github.com/JimmyCJJ
//  Created by JimmyCJJ on 2020/1/8.
//  Copyright © 2020 JimmyCJJ. All rights reserved.
//

#import "CJJCATransition.h"

@implementation CJJCATransition

- (void)addAnimationForView:(UIView *)view
{
    NSLog(@"测试转场动画");
    CATransition *transitionAnimation = [CATransition animation];
    transitionAnimation.duration = 0.5;
    transitionAnimation.type = @"oglFlip";
    [view.layer addAnimation:transitionAnimation forKey:nil];
}

@end
