//
//  UIView+MSMCategories.h
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MSMCategories)

- (void)moveToX:(CGFloat)x;
- (void)moveToY:(CGFloat)y;
- (void)moveToPoint:(CGPoint)point;

- (void)resizeToWidth:(CGFloat)width;
- (void)resizeToHeight:(CGFloat)height;
- (void)resizeToSize:(CGSize)size;
- (void)resizeToScreenHeight;
- (void)resizeToScreenWidth;
- (void)resizeToScreenSize;

- (void)scaleTo:(CGFloat)scale;

- (void)makeCircular;

// animates with a duration of 0.25
+ (void)animate:(void (^)(void))animations NS_AVAILABLE_IOS(4_0);

@end
