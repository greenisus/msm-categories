//
//  UIViewController+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "UIViewController+MSMCategories.h"

@implementation UIViewController (MSMCategories)

- (id)initWithNib {
    return [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
