//
//  ArkWork.h
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArkWork : NSObject

@property (nonatomic, readonly) NSString *company;
@property (nonatomic, readonly) NSString *position;
@property (nonatomic, readonly) NSString *from;
@property (nonatomic, readonly) NSString *to;
@property (nonatomic, readonly) NSString *src;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
