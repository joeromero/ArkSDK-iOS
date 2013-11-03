//
//  ARKProfile.h
//  ArkSDK
//
//  Created by Francisco Rodríguez on 03/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArkProfile : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSString *title;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
