//
//  MiniToLargeViewInteractive.m
//  DraggableViewControllerDemo
//
//  Created by saiday on 11/19/15.
//  Copyright © 2015 saiday. All rights reserved.
//

#import "MiniToLargeViewInteractive.h"

@interface MiniToLargeViewInteractive ()

@property (nonatomic) BOOL shouldComplete;

@end

@implementation MiniToLargeViewInteractive

- (void)attachToViewController:(UIViewController *)viewController withView:(UIView *)view presentViewController:(UIViewController *)presentViewController
{
    self.viewController = viewController;
    self.presentViewController = presentViewController;
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [view addGestureRecognizer:self.pan];
}

- (void)onPan:(UIPanGestureRecognizer *)pan
{
    CGPoint translation = [pan translationInView:pan.view.superview];
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            if (!self.presentViewController) {
                [self.viewController dismissViewControllerAnimated:YES completion:nil];
            } else {
                [self.viewController presentViewController:self.presentViewController animated:YES completion:nil];
            }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            const CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height - 50.f;
            const CGFloat DragAmount = !self.presentViewController ? screenHeight : - screenHeight;
            const CGFloat Threshold = .3f;
            CGFloat percent = translation.y / DragAmount;
            
            percent = fmaxf(percent, 0.f);
            percent = fminf(percent, 1.f);
            [self updateInteractiveTransition:percent];
            
            self.shouldComplete = percent > Threshold;
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            if (pan.state == UIGestureRecognizerStateCancelled || !self.shouldComplete) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}

- (CGFloat)completionSpeed
{
    return 1.f - self.percentComplete;
}

@end