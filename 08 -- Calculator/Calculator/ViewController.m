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
    if (brain.operatorType == OperatorTypeNone)
    {
            [brain.operand1String appendString:sender.titleLabel.text];
    self.displayLabel.text = brain.operand1String;
        
    }
    
    else
    {
        [brain.operand2String appendString:sender.titleLabel.text];
        self.displayLabel.text = brain.operand2String;
    }
    
        
    [[self acLabel] setTitle:@"C" forState:UIControlStateNormal];
    
    
    
}

-(IBAction)periodTappd:(UIButton *)sender
{
    if (!brain)
    {
        brain = [[CalculatorBrain alloc] init];
        brain.operand1String = [@"0." mutableCopy];
        self.displayLabel.text = brain.operand1String;
    }

        
    
    else if ([brain.operand2String isEqualToString:@""])
    {
        brain.operand2String = [@"0." mutableCopy];
        self.displayLabel.text = brain.operand2String;
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
    brain.operand1 = [brain.operand1String floatValue];
    brain.operand2 = [brain.operand2String floatValue];
    
    if (brain.operatorType == OperatorTypeAddition)
    {
        double addAnswer = brain.operand1 + brain.operand2;
        self.displayLabel.text = [NSString stringWithFormat:@"%.1f", addAnswer];
    }
    else if (brain.operatorType == OperatorTypeSubtraction)
    {
        double subAnswer = brain.operand1 - brain.operand2;
        self.displayLabel.text =[NSString stringWithFormat:@"%.1f", subAnswer];
    }
    else if (brain.operatorType == OperatorTypeMultiplication)
    {
        double multAnswer = brain.operand1 * brain.operand2;
        self.displayLabel.text =[NSString stringWithFormat:@"%.1f", multAnswer];
    }
    else if (brain.operatorType == OperatorTypeDivision)
    {
        if (brain.operand2 == 0)
        {
            self.displayLabel.text = @"Error";
            
        }
        else
        {
        double divAnswer = brain.operand1 / brain.operand2;
        self.displayLabel.text =[NSString stringWithFormat:@"%.1f", divAnswer];
        }
    }
    
    
    
    
}
 -(IBAction)acTapped:(UIButton *)sender
{
    brain = nil;
    self.displayLabel.text = @"0";
    [(UIButton*)sender setTitle:@"AC" forState:UIControlStateNormal ];
    
}


@end
