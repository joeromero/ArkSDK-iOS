//
//  NSDictionary+ARKAdditions.m
//  Mail
//
//  Created by Francisco J. Rodríguez on 18/06/13.
//  Copyright (c) 2013 Ark.com. All rights reserved.
//

#import "NSDictionary+ARKAdditions.h"

@implementation NSDictionary (ARKAdditions)

- (id)ark_valueForKeyPath:(NSString *)keyPath
{
    id value = [self valueForKeyPath:keyPath];
    
    if (value == [NSNull null]) {
        return nil;
    }
    
    return value;
}

@end
