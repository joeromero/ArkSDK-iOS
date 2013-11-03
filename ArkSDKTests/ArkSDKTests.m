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
    ArkAPIRequest *request = [ArkAPIRequest requestWithToken:@"8d076931-c608-4849-9f16-76e5de931c0e"];
    [request startProfileRequestWithEmail:@"5ntrol@gmail.com" andCompletionBlock:^(ArkProfile *profile, NSHTTPURLResponse *response, NSError *error) {
        XCTAssertNotNil(profile, @"profile was nil!");
        NSLog(@"%@", profile);
    }];
}

@end
