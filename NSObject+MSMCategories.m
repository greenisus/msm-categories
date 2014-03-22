//
//  NSObject+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "NSObject+MSMCategories.h"

@implementation NSObject (MSMCategories)

- (void)alert:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    [alert show];
    
}

@end
