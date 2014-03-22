//
//  NSDate+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "NSDate+MSMCategories.h"

static NSDateFormatter *_mediumDateFormatter = nil;

@implementation NSDate (MSMCategories)

- (long long)unixTime {
    return (long long)([self timeIntervalSince1970] * 1000);
}

- (NSString *)dayString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEEE";
    return [formatter stringFromDate:self];
    
}

- (NSString *)shortString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    return [dateFormatter stringFromDate:self];
    
}

- (NSString *)mediumString {
    
    if (!_mediumDateFormatter) {
        _mediumDateFormatter = [[NSDateFormatter alloc] init];
        [_mediumDateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [_mediumDateFormatter setTimeStyle:NSDateFormatterNoStyle];
        
    }
    
    // hide the year
    NSString *format = [_mediumDateFormatter dateFormat];
    
    if (![self isMoreThanOneYearAway]) {
        format = [format stringByReplacingOccurrencesOfString:@"y" withString:@""];
        format = [format stringByReplacingOccurrencesOfString:@"," withString:@""];
    }
    
    [_mediumDateFormatter setDateFormat:format];
    
    return [_mediumDateFormatter stringFromDate:self];
    
}

- (NSString *)longString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    return [dateFormatter stringFromDate:self];
    
}

- (BOOL)isToday {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *selfDay = [cal dateFromComponents:components];
    
    return [selfDay isEqualToDate:today];
    
}

- (BOOL)isTodayOrEarlier {
    
    if ([self unixTime] == 0) {
        return NO;
    }
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *selfDay = [cal dateFromComponents:components];
    
    NSComparisonResult result = [selfDay compare:today];
    return result == NSOrderedAscending || result == NSOrderedSame;
    
}

- (BOOL)isMoreThanOneYearAway {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *todayComponents = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:todayComponents];
    
    NSDateComponents *selfComponents = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *selfDay = [cal dateFromComponents:selfComponents];
    
    NSDateComponents *nextYearComponents = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    nextYearComponents.year = 1;
    nextYearComponents.month = -1;
    nextYearComponents.day = -1;
    NSDate *nextYear = [cal dateByAddingComponents:nextYearComponents toDate:today options:0];
    
    NSComparisonResult result = [selfDay compare:nextYear];
    return result == NSOrderedDescending;
    
}

- (BOOL)isLessThanOneWeekAway {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *todayComponents = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:todayComponents];
    
    NSDateComponents *selfComponents = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *selfDay = [cal dateFromComponents:selfComponents];
    
    NSDate *nextWeek = [today dateByAddingTimeInterval:604800];
    
    NSComparisonResult result = [selfDay compare:nextWeek];
    return result == NSOrderedAscending;
    
}

@end
