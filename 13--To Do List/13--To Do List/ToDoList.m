//
//  ToDoList.m
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ToDoList.h"

@implementation ToDoList

-(instancetype) init
{
    self = [super init];
    if (self)
    {
        _done = NO;
    }
    
    return self;
}


@end
