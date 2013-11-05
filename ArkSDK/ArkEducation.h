//
//  ArkEducation.h
//  ArkSDK
//
//  Created by Francisco Rodríguez on 05/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArkEducation : NSObject

@property (nonatomic, readonly) NSString *school;
@property (nonatomic, readonly) NSString *major;
@property (nonatomic, readonly) NSString *from;
@property (nonatomic, readonly) NSString *to;
@property (nonatomic, readonly) NSString *src;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
