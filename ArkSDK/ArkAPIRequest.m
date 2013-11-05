//
//  ArkAPIRequest.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 03/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkAPIRequest.h"

@implementation ArkAPIRequest

+ (instancetype)requestWithToken:(NSString *)token
{
    ArkAPIRequest *request = [[ArkAPIRequest alloc] initWithAPIToken:token];
    return request;
}

- (id)initWithAPIToken:(NSString *)token
{
    self = [super init];
    if (self) {
        _apiToken = [token copy];
        _timeout = 30.0;
    }
    return self;
}

- (void)startProfileRequestWithEmail:(NSString *)email andCompletionBlock:(arkProfileSearchCompletionBlock)completion
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *urlString = [NSString stringWithFormat:@"https://testapi.ark.com/email/%@", email];
        NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setValue:self.apiToken forHTTPHeaderField:@"api_token"];
        [request setHTTPMethod:@"GET"];
        [request setTimeoutInterval:self.timeout];
        
        NSHTTPURLResponse *response = nil;
        NSError *error = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        if (error) {
            if (response.statusCode == 302) {
                double delayInSeconds = 3.0;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    [self startProfileRequestWithEmail:email andCompletionBlock:completion];
                });
            } else if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil, response, error);
                });
            }
        } else {
            NSError *jsonError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
            if (jsonError) {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(nil, response, jsonError);
                    });
                }
            } else {
                ArkProfile *profile = [[ArkProfile alloc] initWithDictionary:dict];
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(profile, response, error);
                    });
                }
            }
        }
//    });
}

@end
