//
//  Car.h
//  The Iron Yard
//
//  Created by Keaton Swoboda on 3/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (copy) NSString *make;
@property (copy) NSString *model;
@property (copy) NSString *color;

-(instancetype)initWithMake:(NSString *)make model:(NSString *)model andColor:(NSString *)color;

//Performs drive action, and returns succes or failure
-(BOOL)drive;

@end
