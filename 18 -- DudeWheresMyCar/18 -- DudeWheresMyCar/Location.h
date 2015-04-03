//
//  Location.h
//  18 -- DudeWheresMyCar
//
//  Created by Keaton Swoboda on 3/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;

@interface Location : NSObject <MKAnnotation, NSCoding>

@property (assign) double latitude;
@property (assign) double longitude;
@property (strong, nonatomic) NSString *name;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D )coordinate pinDescription:(NSString *)pinName;


- (CLLocationCoordinate2D)coordinate;

@end
