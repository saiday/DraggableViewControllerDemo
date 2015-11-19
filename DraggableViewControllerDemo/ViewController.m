//
//  ViewController.m
//  DraggableViewControllerDemo
//
//  Created by saiday on 11/19/15.
//  Copyright © 2015 saiday. All rights reserved.
//

#import "ViewController.h"

#import "DummyView.h"
#import "NextViewController.h"
#import "MiniToLargeViewAnimator.h"
#import "MiniToLargeViewInteractive.h"

static CGFloat kButtonHeight = 50.f;

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic) NextViewController *nextViewController;
@property (nonatomic) MiniToLargeViewInteractive *presentInteractor;
@property (nonatomic) MiniToLargeViewInteractive *dismissInteractor;

@property (nonatomic, weak) UIView *dummyView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DummyView *dummyView = [[DummyView alloc] init];
    dummyView.translatesAutoresizingMaskIntoConstraints = NO;
    [dummyView.button addTarget:self action:@selector(bottomButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dummyView];
    [dummyView addConstraint:[NSLayoutConstraint constraintWithItem:dummyView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:kButtonHeight]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dummyView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:dummyView.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dummyView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:dummyView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dummyView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:dummyView.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    self.dummyView = dummyView;
    
    self.nextViewController = [[NextViewController alloc] init];
    self.nextViewController.rootViewController = self;
    self.nextViewController.transitioningDelegate = self;
    self.nextViewController.modalTransitionStyle = UIModalPresentationCustom;
    self.nextViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    self.presentInteractor = [[MiniToLargeViewInteractive alloc] init];
    [self.presentInteractor attachToViewController:self withView:dummyView presentViewController:self.nextViewController];
    self.dismissInteractor = [[MiniToLargeViewInteractive alloc] init];
    [self.dismissInteractor attachToViewController:self.nextViewController withView:self.nextViewController.view presentViewController:nil];
}

- (void)bottomButtonTapped
{
    self.disableInteractivePlayerTransitioning = YES;
    [self presentViewController:self.nextViewController animated:YES completion:^{
        self.disableInteractivePlayerTransitioning = NO;
    }];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    MiniToLargeViewAnimator *animator = [[MiniToLargeViewAnimator alloc] init];
    animator.initialY = kButtonHeight;
    animator.transitionType = ModalAnimatedTransitioningTypeDismiss;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    MiniToLargeViewAnimator *animator = [[MiniToLargeViewAnimator alloc] init];
    animator.initialY = kButtonHeight;
    animator.transitionType = ModalAnimatedTransitioningTypePresent;
    return animator;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    if (self.disableInteractivePlayerTransitioning) {
        return nil;
    }
    return self.presentInteractor;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    if (self.disableInteractivePlayerTransitioning) {
        return nil;
    }
    return self.dismissInteractor;
}

@end
