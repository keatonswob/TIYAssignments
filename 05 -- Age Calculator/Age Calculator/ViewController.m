//
//  ViewController.m
//  Age Calculator
//
//  Created by Keaton Swoboda on 3/2/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()

{
    NSDateFormatter *gDate;
    NSInteger age;
    NSDate *birth;
    
}

@property (weak, nonatomic) IBOutlet UILabel *currDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *birDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *happLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;



- (IBAction)calcAge:(UIButton *)sender;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"Birthday Calculator";
    
    
   
    gDate = [[NSDateFormatter alloc] init];
    
    
    
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMddyyyy"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    [gDate setDateFormat:formatString];
    
    self.currDateLabel.text = [gDate stringFromDate:[NSDate date]];
    
    age = 0;
    
    self.ageLabel.text = @"";
    
    self.happLabel.text = @"";

    
    UIColor *pattern = [UIColor colorWithPatternImage: [UIImage imageNamed: @"background.png"]] ;
    [self.view setBackgroundColor: pattern] ;
    
    self.view.backgroundColor = pattern;
    
  
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowBirthDatePickerSegue"])
    {
        DatePickerViewController *birthPickerVC = (DatePickerViewController *) [segue destinationViewController];
        
        birthPickerVC.delegate = self;
    }
}

- (void)birthDateWasChosen:(NSDate *)birthDate

{
    self.birDateLabel.text = [gDate stringFromDate:birthDate];
    birth = birthDate;
}



- (IBAction)calcAge:(UIButton *)sender
{
    NSDateComponents *todayComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear fromDate:[NSDate date]];
    NSDateComponents *birthdateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear fromDate:birth];
    
    age = todayComponents.year - birthdateComponents.year;
    

    if (todayComponents.month == birthdateComponents.month)
    {
        if (todayComponents.day < birthdateComponents.day)
        {
            self.ageLabel.text = [NSString stringWithFormat:@"%ld years old", (long)age - 1];
        }
        else if (todayComponents.day == birthdateComponents.day)
        {
            self.ageLabel.text = [NSString stringWithFormat:@"%ld years old", (long)age];
            self.happLabel.text = @"Happy Birthday!!!";
            
        }
        else
        {
            self.ageLabel.text = [NSString stringWithFormat:@"%ld years old", (long)age];
        }
    }

    else if (todayComponents.month < birthdateComponents.month)
    {
        self.ageLabel.text = [NSString stringWithFormat:@"%ld years old", (long)age - 1];
    }
    
    else
    {
        self.ageLabel.text = [NSString stringWithFormat:@"%ld years old", (long)age];
    }
        






}








@end
