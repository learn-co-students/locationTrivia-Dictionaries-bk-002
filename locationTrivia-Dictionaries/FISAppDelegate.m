//
//  FISAppDelegate.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/13/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    if ([location[@"name"]length] >= length) {
    NSMutableString *name = [[location valueForKey:@"name"] mutableCopy];
    NSString *truncatedName = [name substringToIndex:length];
    return truncatedName;
    } else {
        return location[@"name"];
    }
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude  longitude:(CGFloat)longitude {
    NSMutableDictionary *dictionaryForLocation = [NSMutableDictionary new];
    [dictionaryForLocation setObject:name forKey:@"name"];
    [dictionaryForLocation setObject:@(latitude) forKey:@"latitude"];
    [dictionaryForLocation setObject:@(longitude) forKey:@"longitude"];
    return dictionaryForLocation;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *namesOfLocations = [NSMutableArray new];
    for (NSDictionary *location in locations) {
        [namesOfLocations addObject:location[@"name"]];
    }
    return namesOfLocations;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    NSArray *locationKeys = [dictionary allKeys];
    
    if ([locationKeys count] == 3 && [locationKeys containsObject:@"name"] && [locationKeys containsObject:@"latitude"] && [locationKeys containsObject:@"longitude"]) {
        return YES;
    } else {
        return NO;
    }
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqualToString:name]) {
            return location;
        }
    }
    return nil;
}

@end
