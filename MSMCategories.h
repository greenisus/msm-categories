//
//  MSMCategories.h
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#ifndef MSMCategories_MSMCategories_h
#define MSMCategories_MSMCategories_h

#import "UIView+MSMCategories.h"
#import "NSObject+MSMCategories.h"
#import "UITableView+MSMCategories.h"
#import "UIImage+MSMCategories.h"
#import "UIViewController+MSMCategories.h"
#import "NSString+MSMCategories.h"
#import "NSDictionary+MSMCategories.h"

#define $S(format, ...) [NSString stringWithFormat:format, ## __VA_ARGS__]
#define $IMG(name) [UIImage imageNamed:name]
#define $SIMG(name, left, top) [[UIImage imageNamed:name] stretchableImageWithLeftCapWidth:left topCapHeight:top]
#define $URL(format, ...) [NSURL URLWithFormat:format, ## __VA_ARGS__]

// DLog will output like NSLog only when the DEBUG variable is set
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

// ALog will always output like NSLog
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// ULog will show the UIAlertView only when the DEBUG variable is set
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif


#endif
