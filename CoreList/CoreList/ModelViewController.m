//
//  ModelViewController.m
//  CoreList
//
//  Created by Keaton Swoboda on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ModelViewController.h"
#import "ListTableViewController.h"

@interface ModelViewController ()<UITextFieldDelegate>
- (IBAction)saveButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *itemTextField;

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.itemTextField becomeFirstResponder];
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


//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    BOOL rc = NO;
//    
//    if (![textField.text isEqualToString:@""])
//    {
//        rc = YES;
//        ListItem *anItem = [
//        
//            aStuden.lastName = textField.text;
//            aStudent.ageValue = 0;
//            [textField resignFirstResponder];
//            [self saveCoreDataUpdates];
//        
//    }
//    return rc;
//}


- (IBAction)saveButton:(UIButton *)sender
{
    ListItem *anItem = [NSEntityDescription insertNewObjectForEntityForName:@"ListItem" inManagedObjectContext:self.cdStack.managedObjectContext];
    anItem.item = self.itemTextField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self saveCoreDataUpdates];
    
}

- (IBAction)cancelButton:(UIButton *)sender
{
    [self.itemTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)saveCoreDataUpdates
{
    [self.cdStack saveOrFail:^(NSError *errorOrNil)
     {
         if (errorOrNil)
         {
             NSLog(@"Error from CDStack:%@", [errorOrNil localizedDescription]);
         }
         
     }];
}
@end
