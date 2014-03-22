//
//  NSDate+MSMCategories.h
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MSMCategories)

- (long long)unixTime;
- (NSString *)shortString;
- (NSString *)mediumString;
- (NSString *)longString;

- (BOOL)isToday;
- (BOOL)isTodayOrEarlier;
- (BOOL)isMoreThanOneYearAway;
- (BOOL)isLessThanOneWeekAway;
- (NSString *)dayString;

@end
