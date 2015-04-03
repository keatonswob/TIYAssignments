//
//  CounterList.m
//  14--Counter
//
//  Created by Keaton Swoboda on 3/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "CounterList.h"

@implementation CounterList

-(instancetype) init
{
    self = [super init];
    if (self)
    {
        _currentCount = 0;
    }
    return self;
}

@end
