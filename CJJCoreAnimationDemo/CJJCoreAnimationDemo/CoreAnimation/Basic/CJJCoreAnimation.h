//
//  CJJCoreAnimation.h
//  CJJCoreAnimationDemo
//  github:https://github.com/JimmyCJJ
//  Created by JimmyCJJ on 2020/1/8.
//  Copyright © 2020 JimmyCJJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger , CJJAnimationType)
{
    CJJAnimationType_Basic = 101,
    CJJAnimationType_Key,
    CJJAnimationType_Spring,
    CJJAnimationType_Transition,
    CJJAnimationType_Group
};


@interface CJJCoreAnimation : NSObject
+ (instancetype)initAnimation;
- (void)addAnimationForView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
