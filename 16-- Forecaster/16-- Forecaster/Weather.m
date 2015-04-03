//
//  Weather.m
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@implementation Weather

-(BOOL)parseWeatherInfo:(NSDictionary *)infoDictionary
{
    BOOL rc = NO;
    if (infoDictionary)
    {
        NSDictionary *currently = [infoDictionary objectForKey:@"currently"];
        NSString *sumCondition = [currently objectForKey:@"summary"];
        NSString *curTemp = [currently objectForKey:@"currently"];
        self.temperature = [curTemp doubleValue];
        self.summary = sumCondition;
    }
    return rc;
}

@end

