//
//  UIImage+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "UIImage+MSMCategories.h"

@implementation UIImage (MSMCategories)

// taken from http://www.bobbygeorgescu.com/2011/08/finding-average-color-of-uiimage/
- (UIColor *)averageColor {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char rgba[4];
    CGContextRef context = CGBitmapContextCreate(rgba, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), self.CGImage);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    if(rgba[3] > 0) {
        CGFloat alpha = ((CGFloat)rgba[3])/255.0;
        CGFloat multiplier = alpha/255.0;
        return [UIColor colorWithRed:((CGFloat)rgba[0])*multiplier
                               green:((CGFloat)rgba[1])*multiplier
                                blue:((CGFloat)rgba[2])*multiplier
                               alpha:alpha];
    }
    else {
        return [UIColor colorWithRed:((CGFloat)rgba[0])/255.0
                               green:((CGFloat)rgba[1])/255.0
                                blue:((CGFloat)rgba[2])/255.0
                               alpha:((CGFloat)rgba[3])/255.0];
    }
}

// taken from http://stackoverflow.com/questions/2509443/check-if-uicolor-is-dark-or-bright
- (BOOL)isDark {
    
    const CGFloat *componentColors = CGColorGetComponents([self averageColor].CGColor);
    CGFloat colorBrightness = ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000;
    return colorBrightness < 0.6;
    
}

@end
