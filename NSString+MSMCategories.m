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
        return NSLocalizedString([NSString stringWithFormat:@"1 %@", noun], nil);
    } else if (count == 0) {
        return NSLocalizedString([NSString stringWithFormat:@"No %@s", noun], nil);
    } else {
        return [NSString stringWithFormat:NSLocalizedString([NSString stringWithFormat:@"%%i %@s", noun], nil), count];
    }
    
}

+ (NSString *)pluralizedStringWithoutCountForNoun:(NSString *)noun count:(NSInteger)count {
    
    return count > 1 ? [NSString stringWithFormat:@"%@s", noun] : noun;
    
}

+ (NSString *)csvStringFromArray:(NSArray *)stringArray {
    NSString *csvStr = @"";
    
    if (!stringArray || [stringArray count] == 0) {
        return csvStr;
    }
    
    for (NSString *item in stringArray) {
        csvStr = [csvStr stringByAppendingString:[NSString stringWithFormat:@"%@,", item]];
    }
    
    // remove trailing commas
    if (csvStr.length > 0) {
        csvStr = [csvStr substringToIndex:csvStr.length - 1];
    }
    
    return csvStr;
}

#define kEllipsis @"…"

- (NSString *)stringByTruncatingToWidth:(CGFloat)width withFont:(UIFont *)font {
    
    // Create copy that will be the returned result
    NSMutableString *truncatedString = [self mutableCopy];
    
    // Make sure string is longer than requested width
    if ([self sizeWithFont:font].width > width) {
        
        // Accommodate for ellipsis we'll tack on the end
        width -= [kEllipsis sizeWithFont:font].width;
        
        // Get range for last character in string
        NSRange range = {truncatedString.length - 1, 1};
        
        // Loop, deleting characters until string fits within width
        while ([truncatedString sizeWithFont:font].width > width)
        {
            // Delete character at end
            [truncatedString deleteCharactersInRange:range];
            
            // Move back another character
            range.location--;
        }
        
        // Append ellipsis
        [truncatedString replaceCharactersInRange:range withString:kEllipsis];
        
    } else {
        return self;
    }
    
    return truncatedString;
}

// adapted from https://gist.github.com/cihancimen/4146056
- (BOOL)containsEmoji {
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

@end
