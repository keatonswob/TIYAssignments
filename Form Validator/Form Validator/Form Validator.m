//
//  Form Validator.m
//  Form Validator
//
//  Created by Keaton Swoboda on 3/9/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Form Validator.h"

@implementation Form_Validator


- (BOOL)validatePhoneNumber:(NSString *)phoneNumber
{
    BOOL rc = NO
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if ([phoneNumber length] == 10 && [phoneNumber rangeOfCharacterFromSet:set]) {
        <#statements#>
    }
}


- (BOOL)validateZipCode:(NSString *)zipCode
{
    BOOL rc = NO;
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if ([zipCode length] == 5 && [zipCode rangeOfCharacterFromSet:set].location != NSNotFound)
    {
        rc = YES;
    }
    
    return rc;
}

@end
