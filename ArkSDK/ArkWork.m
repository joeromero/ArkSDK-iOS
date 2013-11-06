//
//  ArkWork.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkWork.h"

@interface ArkWork ()

@property (nonatomic, strong) NSDictionary *dict;

- (id)ark_valueForKeyPath:(NSString *)keyPath;

@end

@implementation ArkWork

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.dict = dictionary;
    }
    return self;
}

- (NSString *)company
{
    return [self ark_valueForKeyPath:@"company"];
}

- (NSString *)position
{
    return [self ark_valueForKeyPath:@"position"];
}

- (NSString *)from
{
    return [self ark_valueForKeyPath:@"from"];
}

- (NSString *)to
{
    return [self ark_valueForKeyPath:@"to"];
}

- (NSString *)src
{
    return [self ark_valueForKeyPath:@"src"];
}

- (id)ark_valueForKeyPath:(NSString *)keyPath
{
    id value = [self.dict valueForKeyPath:keyPath];
    
    if (value == [NSNull null]) {
        return nil;
    }
    
    return value;
}

@end
