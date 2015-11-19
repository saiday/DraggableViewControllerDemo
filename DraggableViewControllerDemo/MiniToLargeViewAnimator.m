//
//  MiniToLargeViewAnimator.m
//  DraggableViewControllerDemo
//
//  Created by saiday on 11/19/15.
//  Copyright © 2015 saiday. All rights reserved.
//

#import "MiniToLargeViewAnimator.h"

#import "DummyView.h"

static NSTimeInterval kAnimationDuration = .4f;

@implementation MiniToLargeViewAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return kAnimationDuration;
}

- (void)animatePresentingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC
{
    CGRect fromVCRect = [transitionContext initialFrameForViewController:fromVC];
    CGRect toVCRect = fromVCRect;
    toVCRect.origin.y = toVCRect.size.height - self.initialY;
    
    toVC.view.frame = toVCRect;
    UIView *container = [transitionContext containerView];
    UIView *imageView = [self fakeMiniView];
    [toVC.view addSubview:imageView];
    [container addSubview:fromVC.view];
    [container addSubview:toVC.view];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        toVC.view.frame = fromVCRect;
        imageView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        } else {
            [transitionContext completeTransition:YES];
        }
    }];
}

- (void)animateDismissingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC
{
    CGRect fromVCRect = [transitionContext initialFrameForViewController:fromVC];
    fromVCRect.origin.y = fromVCRect.size.height - self.initialY;
    
    UIView *imageView = [self fakeMiniView];
    [fromVC.view addSubview:imageView];
    UIView *container = [transitionContext containerView];
    [container addSubview:toVC.view];
    [container addSubview:fromVC.view];
    imageView.alpha = 0.f;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        fromVC.view.frame = fromVCRect;
        imageView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
            [toVC.view removeFromSuperview];
        } else {
            [transitionContext completeTransition:YES];
        }
    }];
}

- (UIView *)fakeMiniView
{
    // Fake a mini view, two ways:
    // 1. create a new certain one
    // 2. snapshot old one.
    
    DummyView *dummyView = [[DummyView alloc] initWithFrame:CGRectMake(0.f, 0.f, [[UIScreen mainScreen] bounds].size.width, 50.f)];
    return dummyView;
}

@end
