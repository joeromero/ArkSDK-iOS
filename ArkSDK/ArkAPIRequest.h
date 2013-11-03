//
//  ArkAPIRequest.h
//  ArkSDK
//
//  Created by Francisco Rodríguez on 03/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArkProfile.h"

typedef void(^arkProfileSearchCompletionBlock)(ArkProfile *profile, NSHTTPURLResponse *response, NSError *error);

@interface ArkAPIRequest : NSObject

@property (nonatomic, copy) NSString *apiToken;
@property (nonatomic, assign) NSTimeInterval timeout;

+ (instancetype)requestWithToken:(NSString *)token;

- (id)initWithAPIToken:(NSString *)token;
- (void)startProfileRequestWithEmail:(NSString *)email andCompletionBlock:(arkProfileSearchCompletionBlock)completion;

@end
