//
//  UIView+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "UIView+MSMCategories.h"

#define kMSMAnimationDuration 0.25

@implementation UIView (MSMCategories)

- (void)moveToX:(CGFloat)x {
    CGRect r = self.frame;
    r.origin.x = x;
    self.frame = r;
}

- (void)moveToY:(CGFloat)y {
    CGRect r = self.frame;
    r.origin.y = y;
    self.frame = r;
}

- (void)moveToPoint:(CGPoint)point {
    CGRect r = self.frame;
    r.origin = point;
    self.frame = r;
}

- (void)resizeToWidth:(CGFloat)width {
    CGRect r = self.frame;
    r.size.width = width;
    self.frame = r;
}

- (void)resizeToHeight:(CGFloat)height {
    CGRect r = self.frame;
    r.size.height = height;
    self.frame = r;
}

- (void)resizeToSize:(CGSize)size {
    CGRect r = self.frame;
    r.size = size;
    self.frame = r;
}

- (void)resizeToScreenHeight {
    [self resizeToHeight:[[UIScreen mainScreen] bounds].size.height];
}

- (void)resizeToScreenWidth {
    [self resizeToWidth:[[UIScreen mainScreen] bounds].size.width];
}

- (void)resizeToScreenSize {
    [self resizeToSize:[[UIScreen mainScreen] bounds].size];
}

- (void)makeCircular {
    self.layer.cornerRadius = self.bounds.size.width / 2.0;
    self.clipsToBounds = YES;
}

- (void)scaleTo:(CGFloat)scale {
    self.transform = CGAffineTransformMakeScale(scale, scale);
}

@end
