//
//  CalculatorBrain1.m
//  CalculatorBrain
//
//  Created by Keaton Swoboda on 3/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "CalculatorBrain1.h"

@implementation CalculatorBrain1


-(instancetype)init
{
    self =[super init];
    if (self)
    {
        _operand1String = [[NSMutableString alloc] init];
        _operand2String = [[NSMutableString alloc] init];
        
        _operand1 = 0.0f;
        _operand2 = 0.0f;
        _operatorType = OperatorTypeNone;
        _userIsTypingANumber = NO;
    }
    
    return self;
    
}

- (NSString *) addOperandDigits:(NSString *) digits
{
    NSString *rc;
    if (self.operatorType == OperatorTypeNone)
    {
        [self.operand1String appendString:digits];
        rc = self.operand1String;
        
    }
    else
    {
        [self.operand2String appendString:digits];
        rc = self.operand2String;
    }
    return rc;
}

-(float) useOperator
{
    float returnvalue;
    switch (self.operatorType)
    {
        case OperatorTypeAddition:
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnvalue = self.operand1 + self.operand2;
            break;
        case OperatorTypeSubtraction:
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnvalue = self.operand1 - self.operand2;
            break;
        case OperatorTypeMultiplication:
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnvalue = self.operand1 * self.operand2;
            break;
        case OperatorTypeDivision:
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnvalue = self.operand1 / self.operand2;
            
        default:
            break;
    }
    
    return returnvalue;
    
}


- (NSString *)insertDecimalPoint
{
    NSString *rc;
    
    if (self.operatorType == OperatorTypeNone)
    {
        if ([self.operand1String isEqualToString:@""])
        {
            self.operand1String = [@"0." mutableCopy];
        }
        else if (![self.operand1String containsString:@"."])
        {
            [self.operand1String appendString:@"."];
        }
        rc = self.operand1String;
    }
    else
    {
        if ([self.operand2String isEqualToString:@""])
        {
            self.operand2String = [@".0" mutableCopy];
        }
        else if (![self.operand2String containsString:@"."])
        {
            [self.operand2String appendString:@"."];
            
        }
        rc = self.operand2String;
    }
    return rc;
}
- (float) signChanger
{
    float rc;
    if (self.operatorType == OperatorTypeNone && self.operand1String)
    {
        self.operand1 = [self.operand1String floatValue];
        float signChange = self.operand1 * -1;
        self.operand1String = [NSMutableString stringWithFormat:@"%g", signChange];
        rc = signChange;
        
    }
    else if (self.operatorType != OperatorTypeNone && self.operand2String)
    {
        self.operand2 = [self.operand2String floatValue];
        float signChange = self.operand2 * -1;
        self.operand2String = [NSMutableString stringWithFormat:@"%g", signChange];
        rc = signChange;
    }
    return rc;
}

- (float) percentChanger
{
    float rc;
    if (self.operatorType == OperatorTypeNone && self.operand1String)
    {
        self.operand1 = [self.operand1String floatValue];
        float signChange = self.operand1 * .01;
        self.operand1String = [NSMutableString stringWithFormat:@"%g", signChange];
        rc = signChange;
        
    }
    else if (self.operatorType != OperatorTypeNone && self.operand2String)
    {
        self.operand2 = [self.operand2String floatValue];
        float signChange = self.operand2 * .01;
        self.operand2String = [NSMutableString stringWithFormat:@"%g", signChange];
        rc = signChange;
    }
    return rc;
}




@end

