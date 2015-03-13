//
//  CalculatorBrain1.h
//  CalculatorBrain
//
//  Created by Keaton Swoboda on 3/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    OperatorTypeNone,
    OperatorTypeAddition,
    OperatorTypeSubtraction,
    OperatorTypeMultiplication,
    OperatorTypeDivision
}OperatorType;

@interface CalculatorBrain1 : NSObject

@property (strong, nonatomic) NSMutableString *operand1String;
@property (strong, nonatomic) NSMutableString *operand2String;

@property (assign) float operand1;
@property (assign) float operand2;
@property (assign) OperatorType operatorType;
@property (assign) BOOL userIsTypingANumber;

- (NSString *) addOperandDigits:(NSString *)digit;
- (NSString *)insertDecimalPoint;
- (float) signChanger;
- (float) percentChanger;
- (float) useOperator;

@end