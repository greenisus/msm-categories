//
//  UITableView+MSMCategories.h
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (MSMCategories)

- (void)registerIBCellClass:(Class)klass;
- (id)dequeueReusableIBCellWithClass:(Class)klass forIndexPath:(NSIndexPath *)indexPath;

@end
