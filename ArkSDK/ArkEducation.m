//
//  ArkEducation.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkEducation.h"

@interface ArkEducation ()

@property (nonatomic, strong) NSDictionary *dict;

- (id)ark_valueForKeyPath:(NSString *)keyPath;

@end

@implementation ArkEducation

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.dict = dictionary;
    }
    return self;
}

- (NSString *)school
{
    return [self ark_valueForKeyPath:@"school"];
}

- (NSString *)major
{
    return [self ark_valueForKeyPath:@"major"];
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
