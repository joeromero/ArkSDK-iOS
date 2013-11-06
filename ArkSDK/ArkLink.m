//
//  ArkLink.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkLink.h"

@interface ArkLink ()

@property (nonatomic, strong) NSDictionary *dict;

- (id)ark_valueForKeyPath:(NSString *)keyPath;

@end

@implementation ArkLink

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.dict = dictionary;
    }
    return self;
}

- (NSString *)email
{
    return [self ark_valueForKeyPath:@"email"];
}

- (NSString *)networkName
{
    return [self ark_valueForKeyPath:@"network_name"];
}

- (NSString *)networkId
{
    return [self ark_valueForKeyPath:@"network_id"];
}

- (NSString *)profileUrl
{
    return [self ark_valueForKeyPath:@"profile_url"];
}

- (NSString *)profileId
{
    return [self ark_valueForKeyPath:@"profile_id"];
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
