//
//  DatePickerViewController.m
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/29/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "DatePickerViewController.h"



@interface DatePickerViewController ()

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)cancelButton:(UIBarButtonItem *)sender
{
    [self cancel];
}

- (IBAction)doneButton:(UIBarButtonItem *)sender
{
   [self.delegate destinationDateWasChosen:self.datePicker.date];
    
    [self cancel];
}
-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
