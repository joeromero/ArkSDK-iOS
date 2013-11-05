//
//  ArkLink.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkLink.h"
#import "NSDictionary+ARKAdditions.h"

@interface ArkLink ()

@property (nonatomic, strong) NSDictionary *dict;

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
    return [self.dict ark_valueForKeyPath:@"email"];
}

- (NSString *)networkName
{
    return [self.dict ark_valueForKeyPath:@"network_name"];
}

- (NSString *)networkId
{
    return [self.dict ark_valueForKeyPath:@"network_id"];
}

- (NSString *)profileUrl
{
    return [self.dict ark_valueForKeyPath:@"profile_url"];
}

- (NSString *)profileId
{
    return [self.dict ark_valueForKeyPath:@"profile_id"];
}

@end
