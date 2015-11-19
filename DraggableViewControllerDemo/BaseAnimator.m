//
//  BaseAnimator.m
//  DraggableViewControllerDemo
//
//  Created by saiday on 11/19/15.
//  Copyright © 2015 saiday. All rights reserved.
//

#import "BaseAnimator.h"

@implementation BaseAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (self.transitionType == ModalAnimatedTransitioningTypePresent) {
        [self animatePresentingInContext:transitionContext toVC:to fromVC:from];
    } else if (self.transitionType == ModalAnimatedTransitioningTypeDismiss) {
        [self animateDismissingInContext:transitionContext toVC:to fromVC:from];
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // mustOverride()
    // mustOverride() is a marco took from stackoverflow Yar's answer, or you can use nicklockwood's solution MustOverride GitHub. You can left it blank as well, what mustOverride() does is throw an exception when we forget override the method in subclass.
    // http://stackoverflow.com/questions/1034373/creating-an-abstract-class-in-objective-c/6448761#6448761
    
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"%s must be overridden in a subclass/category", __PRETTY_FUNCTION__] userInfo:nil];
}

- (void)animatePresentingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC
{
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"%s must be overridden in a subclass/category", __PRETTY_FUNCTION__] userInfo:nil];
}

- (void)animateDismissingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC
{
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"%s must be overridden in a subclass/category", __PRETTY_FUNCTION__] userInfo:nil];
}

@end