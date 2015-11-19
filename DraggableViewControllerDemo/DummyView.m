//
//  DummyView.m
//  DraggableViewControllerDemo
//
//  Created by saiday on 11/19/15.
//  Copyright © 2015 saiday. All rights reserved.
//

#import "DummyView.h"

@implementation DummyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    
    return self;
}

- (void)setupSubview
{
    UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomButton.translatesAutoresizingMaskIntoConstraints = NO;
    bottomButton.backgroundColor = [UIColor grayColor];
    [bottomButton setTitle:@"Tap or drag me" forState:UIControlStateNormal];
    [self addSubview:bottomButton];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bottomButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bottomButton.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bottomButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bottomButton.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bottomButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:bottomButton.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bottomButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bottomButton.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];

    self.button = bottomButton;
}

@end
