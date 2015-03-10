//
//  ViewController.m
//  Form Validator
//
//  Created by Keaton Swoboda on 3/9/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController ()<UITextFieldDelegate>

{
    FormValidator *validator;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    validator = [[FormValidator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (textField == self.nameTextField)
    {
       rc = [validator validateName:self.nameTextField.text];
        if (rc)
        {
            [textField resignFirstResponder];
            
        }
    }

  
    

    if (textField == self.streetTextField)
        {
          rc = [validator validateAddress:self.streetTextField.text];
            if (rc)
            {
                [textField resignFirstResponder];
                
            }
        }
    if (textField == self.cityTextField)
    {
        rc = [validator validateCity:self.cityTextField.text];
    }
    if (textField == self.stateTextField)
    {
        rc = [validator validateState:self.stateTextField.text];
    }
    if (textField == self.zipTextField)
    {
       rc = [validator validateZipCode:self.zipTextField.text];
    }
    if (textField == self.phoneTextField)
    {
       rc = [validator validatePhoneNumber:self.phoneTextField.text];
    }
    if (rc)
    {
        [textField resignFirstResponder];
    }
    

    return rc;
}




@end
