//
//  ArkWork.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkWork.h"
#import "NSDictionary+ARKAdditions.h"

@interface ArkWork ()

@property (nonatomic, strong) NSDictionary *dict;

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
    return [self.dict ark_valueForKeyPath:@"company"];
}

- (NSString *)position
{
    return [self.dict ark_valueForKeyPath:@"position"];
}

- (NSString *)from
{
    return [self.dict ark_valueForKeyPath:@"from"];
}

- (NSString *)to
{
    return [self.dict ark_valueForKeyPath:@"to"];
}

- (NSString *)src
{
    return [self.dict ark_valueForKeyPath:@"src"];
}

@end
