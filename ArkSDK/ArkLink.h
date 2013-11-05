//
//  ArkLink.h
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArkLink : NSObject

@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *networkName;
@property (nonatomic, readonly) NSString *networkId;
@property (nonatomic, readonly) NSString *profileUrl;
@property (nonatomic, readonly) NSString *profileId;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
