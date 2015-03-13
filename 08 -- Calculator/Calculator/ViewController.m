//
//  ViewController.m
//  Calculator
//
//  Created by Keaton Swoboda on 3/5/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
{
    CalculatorBrain *brain;
}

@property(weak, nonatomic) IBOutlet UILabel *displayLabel;
@property(weak, nonatomic) IBOutlet UIButton *acLabel;

-(IBAction)operandTapped:(UIButton *)sender;
-(IBAction)additionTapped:(UIButton*)sender;
-(IBAction)subtractionTapped:(UIButton*)sender;
-(IBAction)multiplicationTapped:(UIButton*)sender;
-(IBAction)divisionTapped:(UIButton*)sender;
-(IBAction)equalTapped:(UIButton*)sender;
-(IBAction)acTapped:(UIButton*)sender;
-(IBAction)periodTappd:(UIButton*)sender;
-(IBAction)percentConvertButton:(UIButton*)sender;
-(IBAction)signChanger:(UIButton*)sender;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.displayLabel.text = @"0";
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)operandTapped:(UIButton *)sender
{
    if (!brain)
    {
        brain = [[CalculatorBrain alloc] init];
    }
    self.displayLabel.text = [brain addOperandDigits:sender.titleLabel.text];
    
  
    
    
        
    [[self acLabel] setTitle:@"C" forState:UIControlStateNormal];
    
    
    
}

-(IBAction)periodTappd:(UIButton *)sender
{

    if (!brain)
    {
        brain = [[CalculatorBrain alloc] init];
     
    }
    self.displayLabel.text = [brain insertDecimalPoint];
   
}

-(IBAction)percentConvertButton:(UIButton *)sender
{
    if (brain)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"%g", brain.percentChanger];
    }
    
}

-(IBAction)signChanger:(UIButton *)sender
{
    if (brain)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"%g", brain.signChanger];
        
    }
}



-(IBAction)additionTapped:(UIButton *)sender
{
    brain.OperatorType = OperatorTypeAddition;
}

-(IBAction)subtractionTapped:(UIButton*)sender;
{
    brain.OperatorType = OperatorTypeSubtraction;
}
-(IBAction)multiplicationTapped:(UIButton*)sender;
{
    brain.OperatorType = OperatorTypeMultiplication;
}
-(IBAction)divisionTapped:(UIButton*)sender;
{
    brain.OperatorType = OperatorTypeDivision;
}
-(IBAction)equalTapped:(UIButton*)sender;
{
    float returnvalue = [brain useOperator];
    if (OperatorTypeDivision && brain.operand2 == 0)
    {
        self.displayLabel.text = @"0";
    }
    else
    {
        self.displayLabel.text = [NSString stringWithFormat:@"%g", returnvalue];
    }
    
    brain = nil;
    
    
}
 -(IBAction)acTapped:(UIButton *)sender
{
    brain = nil;
    self.displayLabel.text = @"0";
    [(UIButton*)sender setTitle:@"AC" forState:UIControlStateNormal ];
    
}


@end
