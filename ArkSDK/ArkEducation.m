//
//  ArkEducation.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkEducation.h"
#import "NSDictionary+ARKAdditions.h"

@interface ArkEducation ()

@property (nonatomic, strong) NSDictionary *dict;

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
    return [self.dict ark_valueForKeyPath:@"school"];
}

- (NSString *)major
{
    return [self.dict ark_valueForKeyPath:@"major"];
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
