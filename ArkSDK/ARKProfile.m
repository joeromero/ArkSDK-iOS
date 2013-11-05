//
//  ARKProfile.m
//  ArkSDK
//
//  Created by Francisco Rodríguez on 03/11/13.
//  Copyright (c) 2013 Ark. All rights reserved.
//

#import "ArkProfile.h"
#import "NSDictionary+ARKAdditions.h"
#import "ArkLink.h"
#import "ArkEducation.h"
#import "ArkWork.h"

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

- (NSArray *)pics
{
    return [self.dict ark_valueForKeyPath:@"pics"];
}

- (NSArray *)emails
{
    return [self.dict ark_valueForKeyPath:@"emails"];    
}

- (NSArray *)links
{
    NSArray *links = [self.dict ark_valueForKeyPath:@"links"];
    NSMutableArray *linkObjs = [[NSMutableArray alloc] initWithCapacity:links.count];
    for (NSDictionary *dict in links) {
        ArkLink *link = [[ArkLink alloc] initWithDictionary:dict];
        [linkObjs addObject:link];
    }
    
    return linkObjs;
}

- (NSArray *)languages
{
    return [self.dict ark_valueForKeyPath:@"languages"];
}

- (NSArray *)education
{
    NSArray *educations = [self.dict ark_valueForKeyPath:@"education"];
    NSMutableArray *educationObjs = [[NSMutableArray alloc] initWithCapacity:educations.count];
    for (NSDictionary *dict in educations) {
        ArkEducation *edu = [[ArkEducation alloc] initWithDictionary:dict];
        [educationObjs addObject:edu];
    }
    
    return educationObjs;
}

- (NSArray *)work
{
    NSArray *works = [self.dict ark_valueForKeyPath:@"education"];
    NSMutableArray *workObjs = [[NSMutableArray alloc] initWithCapacity:works.count];
    for (NSDictionary *dict in works) {
        ArkWork *work = [[ArkWork alloc] initWithDictionary:dict];
        [workObjs addObject:work];
    }
    
    return workObjs;
}

- (void)workingPicsWithCompletionBlock:(workingPicsCompletionBlock)completion
{
    NSArray *pics = self.pics;
    NSMutableArray *working = [[NSMutableArray alloc] initWithCapacity:pics.count];
    dispatch_group_t group = dispatch_group_create();
    for (NSString *url in pics) {
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
            [request setHTTPMethod:@"HEAD"];
            [request setTimeoutInterval:3.0];
            NSHTTPURLResponse *response;
            [NSURLConnection sendSynchronousRequest:request returningResponse:&response error: NULL];
            if ([response respondsToSelector:@selector(allHeaderFields)]) {
                NSString *imageSize = [[response allHeaderFields] objectForKey:@"Content-Length"];
                if ([imageSize intValue] >= 2) {
                    [working addObject:url];
                }
            }
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (completion) {
            completion(working);
        }
    });
}

@end
