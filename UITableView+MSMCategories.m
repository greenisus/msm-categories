//
//  UITableView+MSMCategories.m
//  MSMCategories
//
//  Created by Mike Mayo on 3/21/14.
//  Copyright (c) 2014 Mike Mayo. All rights reserved.
//

#import "UITableView+MSMCategories.h"

@implementation UITableView (MSMCategories)

- (void)registerIBCellClass:(Class)klass {
    
    NSString *className = NSStringFromClass(klass);
    [self registerNib:[UINib nibWithNibName:className bundle:nil] forCellReuseIdentifier:className];
    
}

- (id)dequeueReusableIBCellWithClass:(Class)klass forIndexPath:(NSIndexPath *)indexPath {
    
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(klass) forIndexPath:indexPath];
    
}

@end
