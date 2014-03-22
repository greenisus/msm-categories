//
//  NSString+MSMCategories.h
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MSMCategories)

- (NSString *)trim;

+ (NSString *)pluralizedStringForNoun:(NSString *)noun count:(NSInteger)count;
+ (NSString *)pluralizedStringWithoutCountForNoun:(NSString *)noun count:(NSInteger)count;
+ (NSString *)csvStringFromArray:(NSArray *)stringArray;

// adapted from http://iphonedevelopertips.com/cocoa/truncate-an-nsstring-and-append-an-ellipsis-respecting-the-font-size.html
- (NSString*)stringByTruncatingToWidth:(CGFloat)width withFont:(UIFont *)font;

- (BOOL)containsEmoji;

@end
