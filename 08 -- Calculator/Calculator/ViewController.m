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
        self.displayLabel.text = [NSString stringWithFormat:@"%.0f", addAnswer];
    }
    else if (brain.operatorType == OperatorTypeSubtraction)
    {
        double subAnswer = brain.operand1 - brain.operand2;
        self.displayLabel.text =[NSString stringWithFormat:@"%.0f", subAnswer];
    }
    else if (brain.operatorType == OperatorTypeMultiplication)
    {
        double multAnswer = brain.operand1 * brain.operand2;
        self.displayLabel.text =[NSString stringWithFormat:@"%.0f", multAnswer];
    }
    else if (brain.operatorType == OperatorTypeDivision)
    {
        double divAnswer = brain.operand1 / brain.operand2;
        self.displayLabel.text =[NSString stringWithFormat:@"%.0f", divAnswer];
    }
    
    
    
    
}
 -(IBAction)acTapped:(UIButton *)sender
{
    brain = nil;
    self.displayLabel.text = @"0";
    [(UIButton*)sender setTitle:@"AC" forState:UIControlStateNormal ];
    
}


@end
