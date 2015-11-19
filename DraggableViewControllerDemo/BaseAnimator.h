//
//  BaseAnimator.h
//  DraggableViewControllerDemo
//
//  Created by saiday on 11/19/15.
//  Copyright © 2015 saiday. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ModalAnimatedTransitioningType) {
    ModalAnimatedTransitioningTypePresent,
    ModalAnimatedTransitioningTypeDismiss
};

@interface BaseAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) ModalAnimatedTransitioningType transitionType;

- (void)animatePresentingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC;
- (void)animateDismissingInContext:(id<UIViewControllerContextTransitioning>)transitionContext toVC:(UIViewController *)toVC fromVC:(UIViewController *)fromVC;

@end