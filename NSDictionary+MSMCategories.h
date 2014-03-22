//
//  NSDictionary+MSMCategories.h
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MSMCategories)

/** Intended to be called on a dictionary of dictionaries.  Returns a copy
 *  where every NSDictionary is converted to an NSMutableDictionary.
 */
- (NSMutableDictionary *)recursivelyMutableDictionary;

@end
