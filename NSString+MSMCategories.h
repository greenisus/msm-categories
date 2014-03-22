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

@end
