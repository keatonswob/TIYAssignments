//
//  Energy.h
//  High Voltage
//
//  Created by Keaton Swoboda on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    EnergyTypeWatts,
    EnergyTypeVolts,
    EnergyTypeAmps,
    EnergyTypeOhms
    
}EnergyType;

@interface Energy : NSObject

@property (strong, nonatomic) NSString *energyName;
@property (assign) EnergyType type;

+(NSArray*)allEnergyTypes;

@end
