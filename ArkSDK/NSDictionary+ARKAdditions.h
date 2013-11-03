//
//  NSDictionary+ARKAdditions.h
//  Mail
//
//  Created by Francisco J. Rodríguez on 18/06/13.
//  Copyright (c) 2013 Ark.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ARKAdditions)

- (id)ark_valueForKeyPath:(NSString *)keyPath;

@end
