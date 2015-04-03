//
//  City.m
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@implementation City

- (instancetype)initWithZipCode:(NSString *)zip
{
    if (self)
    {
        self = [super init];
        
        _zipCode = zip;
        
    }
    return self;
}

- (BOOL)parseCoordinateInfo:(NSDictionary *)mapsDictionary
{
    BOOL rc = NO;
    if (mapsDictionary)
    {
        rc = YES;
        NSArray *results = [mapsDictionary objectForKey:@"results"];
        NSDictionary *locInfo = results [0];
        NSArray *addyComponents = [locInfo objectForKey:@"address_components"];
        NSDictionary *locationInfo = addyComponents [1];
        NSDictionary *geometry = [locInfo objectForKey:@"geometry"];
        NSDictionary *latlngLocation = [geometry objectForKey:@"location"];
        NSString *latInfo = [latlngLocation objectForKey:@"lat"];
        NSString *lngInfo = [latlngLocation objectForKey:@"lng"];
        NSString *cityName = [locationInfo objectForKey:@"long_name"];
        self.latitude = [latInfo doubleValue];
        self.longitude = [lngInfo doubleValue];
        self.name = cityName;
        
       
    }
    return rc;
}

@end