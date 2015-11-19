//
//  MiniToLargeViewInteractive.h
//  DraggableViewControllerDemo
//
//  Created by saiday on 11/19/15.
//  Copyright © 2015 saiday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiniToLargeViewInteractive : UIPercentDrivenInteractiveTransition

@property (nonatomic) UIViewController *viewController;
@property (nonatomic) UIViewController *presentViewController;
@property (nonatomic) UIPanGestureRecognizer *pan;

- (void)attachToViewController:(UIViewController *)viewController withView:(UIView *)view presentViewController:(UIViewController *)presentViewController;

@end