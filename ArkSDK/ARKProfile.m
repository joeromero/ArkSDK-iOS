//
//  ARKProfile.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 03/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkProfile.h"
#import "NSDictionary+ARKAdditions.h"

@interface ArkProfile ()

@property (nonatomic, strong) NSDictionary *dict;

@end

@implementation ArkProfile

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.dict = dictionary;
    }
    return self;
}

- (NSString *)name
{
    return [self.dict ark_valueForKeyPath:@"name"];
}

- (NSString *)location
{
    return [self.dict ark_valueForKeyPath:@"location"];
}

- (NSString *)title
{
    return [self.dict ark_valueForKeyPath:@"title"];
}

@end
