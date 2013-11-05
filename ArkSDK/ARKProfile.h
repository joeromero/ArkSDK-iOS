//
//  ARKProfile.h
//  ArkSDK
//
//  Created by Francisco Rodríguez on 03/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^workingPicsCompletionBlock)(NSArray *workingPics);

@interface ArkProfile : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSArray *pics;
@property (nonatomic, readonly) NSArray *emails;
@property (nonatomic, readonly) NSArray *links;
@property (nonatomic, readonly) NSArray *languages;
@property (nonatomic, readonly) NSArray *education;
@property (nonatomic, readonly) NSArray *work;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (void)workingPicsWithCompletionBlock:(workingPicsCompletionBlock)completion;

@end
