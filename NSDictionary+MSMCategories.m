//
//  NSDictionary+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "NSDictionary+MSMCategories.h"

@implementation NSDictionary (MSMCategories)

- (NSMutableDictionary *)recursivelyMutableDictionary {
    
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithDictionary:self];
    NSMutableDictionary *changes = [[NSMutableDictionary alloc] init];
    for (id key in mdict) {
        
        id obj = [mdict objectForKey:key];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            NSMutableDictionary *mobj = [obj recursivelyMutableDictionary];
            [changes setObject:mobj forKey:key];
            
        }
        
    }
    
    for (id key in changes) {
        
        id mobj = [changes objectForKey:key];
        [mdict setObject:mobj forKey:key];
        
    }
    
    return mdict;
    
}

@end
