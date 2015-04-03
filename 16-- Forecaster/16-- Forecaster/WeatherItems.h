//
//  WeatherItems.h
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherItems : NSObject<NSURLSessionDataDelegate>
{
    NSMutableData *receivedData;
}

@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSString *latObj;
@property (strong, nonatomic) NSString *longObj;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *currentTemp;
//@property (strong, nonatomic) NSString *

-(void)weatherForecast;




@end