//
//  Energy.m
//  High Voltage
//
//  Created by Keaton Swoboda on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Energy.h"

@implementation Energy

+(NSMutableArray*)allEnergyTypes;
{
    return [[NSMutableArray alloc] initWithObjects:@"Volts", @"Amps", @"Ohms", @"Watts", nil ];
}


@end
