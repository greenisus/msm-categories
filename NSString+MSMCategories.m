//
//  NSString+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "NSString+MSMCategories.h"

@implementation NSString (MSMCategories)

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)pluralizedStringForNoun:(NSString *)noun count:(NSInteger)count {
    
    if (count == 1) {
        return NSLocalizedString(([NSString stringWithFormat:@"1 %@", noun]), nil);
    } else if (count == 0) {
        return NSLocalizedString(([NSString stringWithFormat:@"No %@s", noun]), nil);
    } else {
        return [NSString stringWithFormat:NSLocalizedString(([NSString stringWithFormat:@"%%i %@s", noun]), nil), count];
    }
    
}

+ (NSString *)pluralizedStringWithoutCountForNoun:(NSString *)noun count:(NSInteger)count {
    
    return count > 1 ? [NSString stringWithFormat:@"%@s", noun] : noun;
    
}

@end
