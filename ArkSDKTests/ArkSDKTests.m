//
//  ArkSDKTests.m
//  ArkSDKTests
//
//  Created by Francisco Rodríguez on 03/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ArkSDK.h"

@interface ArkSDKTests : XCTestCase

@end

@implementation ArkSDKTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    ArkAPIRequest *request = [ArkAPIRequest requestWithToken:@"8d076931-c608-4849-9f16-76e5de931c0e"];
    __block ArkProfile *prof = nil;
    [request startProfileRequestWithEmail:@"5ntrol@gmail.com" andCompletionBlock:^(ArkProfile *profile, NSHTTPURLResponse *response, NSError *error) {
        prof = profile;
        dispatch_semaphore_signal(semaphore);
    }];
    dispatch_semaphore_wait(semaphore, 10.0);
    XCTAssertNotNil(prof, @"profile was nil!");
    NSLog(@"%@", prof);
}

@end
