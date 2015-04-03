//
//  Location.m
//  18 -- DudeWheresMyCar
//
//  Created by Keaton Swoboda on 3/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Location.h"

@interface Location()

@property (nonatomic) CLLocationCoordinate2D coordinate;



@end

@implementation Location

-(CLLocationCoordinate2D)coordinate
{
    return _coordinate;
}
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D )coordinate pinDescription:(NSString *)pinName
{
    self = [super init];
    if (self)
    {
        
//        _latitude = lat;
//        _longitude = lng;
        _name = pinName;
        _coordinate = coordinate;
    }
    return self;
}
-(NSString *)title
{
    
    return self.name;
}


#pragma mark - NSCoding

#define knameKey @"name"
#define klatitudeKey @"latitude"
#define klongitudeKey @"longitude"

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:knameKey];
    [aCoder encodeDouble:self.coordinate.latitude forKey:klatitudeKey];
    [aCoder encodeDouble:self.coordinate.longitude forKey:klongitudeKey];

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    NSString *pinName = [aDecoder decodeObjectForKey:knameKey];
    double latitude = [aDecoder decodeDoubleForKey:klatitudeKey];
    double longitude = [aDecoder decodeDoubleForKey:klongitudeKey];
    

    
    return [self initWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude) pinDescription:pinName];

}


@end
