//
//  AnimationVC.m
//  CJJCoreAnimationDemo
//  github:https://github.com/JimmyCJJ
//  Created by JimmyCJJ on 2020/1/10.
//  Copyright © 2020 JimmyCJJ. All rights reserved.
//

#import "AnimationVC.h"
#import "CATransitionVC.h"

@interface AnimationVC ()
@property (nonatomic,assign) CJJAnimationType type;
@property (nonatomic,strong) UIImageView *animationImg;
@property (nonatomic,strong) UIButton *animationBtn;
@end

@implementation AnimationVC

- (instancetype)initWithType:(CJJAnimationType)type
{
    self = [super init];
    if (self) {
        _type = type;
        NSLog(@"==%ld",_type);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViews];
    [self setLayout];
}

- (void)setViews{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.animationImg];
    [self.view addSubview:self.animationBtn];
}

- (void)setLayout{
    [_animationImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [_animationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-50);
    }];
}

#pragma mark - action

- (void)animationClick:(UIButton *)btn{
    switch (_type) {
        case CJJAnimationType_Basic:
            [self testCABasicAnimation];
            break;
        case CJJAnimationType_Key:
            [self testCAKeyframeAnimation];
            break;
        case CJJAnimationType_Spring:
            [self testCASpringAnimation];
            break;
        case CJJAnimationType_Transition:
            [self testCATransition];
            break;
        case CJJAnimationType_Group:
            [self testCAAnimationGroup];
            break;
    }
}

#pragma mark - test CoreAnimation

- (void)testCABasicAnimation
{
    CJJCABasicAnimation *basicAnimation = [CJJCABasicAnimation initAnimation];
    [basicAnimation addAnimationForView:self.animationImg];
}

- (void)testCAKeyframeAnimation
{
    CJJCAKeyframeAnimation *keyAnimation = [CJJCAKeyframeAnimation initAnimation];
    [keyAnimation addAnimationForView:self.animationImg];
}

- (void)testCASpringAnimation
{
    CJJCASpringAnimation *springAnimation = [CJJCASpringAnimation initAnimation];
    [springAnimation addAnimationForView:self.animationImg];
}

- (void)testCATransition
{
    
    CJJCATransition *tranAnimation = [CJJCATransition initAnimation];
    [tranAnimation addAnimationForView:self.navigationController.view];
    CATransitionVC *v1 = [CATransitionVC new];
    [self.navigationController pushViewController:v1 animated:YES];
}

- (void)testCAAnimationGroup
{
    CJJCAAnimationGroup *groupsAnimation = [CJJCAAnimationGroup initAnimation];
    [groupsAnimation addAnimationForView:self.animationImg];
}

//#pragma mark - UIViewControllerAnimatedTransitioning
//// 定义转场动画的时间
//- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;
//{
//    return 2.f;
//}
//
//// 定义转场动画的行为
//- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
//{
//     //取出转场前后的视图控制器
//    UIViewController *fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewKey];
//    UIViewController *toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewKey];
//
//    //取出转场前后的view
//    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
//
//    //这里有个重要的概念container,要做转场动画的视图就必须要加入containerView上才能进行，可以理解containerView管理着所有做转场动画的视图
//    UIView *containerView = [transitionContext containerView];
//
//    //如果加入了手势交互转场，就需要根据手势交互动作是否完成/取消来做操作，完成标记YES，取消标记NO,否则系统认为还处于动画过程中，会出现无法交互之类的bug
//    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//     if([transitionContext transitionWasCancelled])
//     {
//        //如果取消转场
//
//    }else{
//        //完成转场
//
//    }
//}


#pragma mark - lazy

- (UIImageView *)animationImg{
    if(!_animationImg){
        _animationImg = [[UIImageView alloc] initWithImage:[self buttonImageFromColor:[UIColor blackColor]]];
        _animationImg.layer.cornerRadius = 50;
        _animationImg.layer.masksToBounds = YES;
    }
    return _animationImg;
}

//通过颜色来生成一个纯色图片
- (UIImage *)buttonImageFromColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (UIButton *)animationBtn{
    if(!_animationBtn)
    {
        _animationBtn = [UIButton new];
        [_animationBtn setTitle:@"开始动画" forState:UIControlStateNormal];
        [_animationBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_animationBtn addTarget:self action:@selector(animationClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _animationBtn;
}

@end
