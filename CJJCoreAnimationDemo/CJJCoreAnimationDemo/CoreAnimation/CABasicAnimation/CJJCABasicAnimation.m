//
//  CJJCABasicAnimation.m
//  CJJCoreAnimationDemo
//  github:https://github.com/JimmyCJJ
//  Created by JimmyCJJ on 2020/1/8.
//  Copyright © 2020 JimmyCJJ. All rights reserved.
//

#import "CJJCABasicAnimation.h"

@implementation CJJCABasicAnimation

- (void)addAnimationForView:(UIView *)view
{
    NSLog(@"测试基本动画");
//    [self positionWithView:view];
    [self transform_rotation_zWithView:view];
}

- (void)positionWithView:(UIView *)view
{
    CABasicAnimation *position = [CABasicAnimation animationWithKeyPath:@"position"];
    position.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    position.fillMode = kCAFillModeForwards;
    position.removedOnCompletion = YES;
    [view.layer addAnimation:position forKey:nil];
}

- (void)transform_rotation_zWithView:(UIView *)view
{
    CABasicAnimation *transfrom_rotation_z = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若把fromValue和toValue的值互换，则为逆时针效果
    transfrom_rotation_z.fromValue = [NSNumber numberWithFloat:0.f];
    transfrom_rotation_z.toValue = [NSNumber numberWithFloat:M_PI * 2];
    transfrom_rotation_z.duration = 0.8;
    transfrom_rotation_z.autoreverses = NO;
    transfrom_rotation_z.fillMode = kCAFillModeForwards;
    transfrom_rotation_z.repeatCount = MAXFLOAT;
    //以上缩放是以view的中心点为中心缩放的，如果需要自定义缩放点，可以设置卯点：
//    //中心点
//    [view.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
//    //左上角
//    [view.layer setAnchorPoint:CGPointMake(0, 0)];
    //右下角
    [view.layer setAnchorPoint:CGPointMake(1, 1)];
    //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    [view.layer addAnimation:transfrom_rotation_z forKey:nil];
}

@end
