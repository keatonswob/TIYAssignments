//
//  ToDoDetailTableViewController.h
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/27/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoList.h"

@import MapKit;

@protocol ToDoDetailDatePickerDelegate

- (void)destinationDateWasChosen:(NSDate *)destinationDate;

@end

@interface ToDoDetailTableViewController : UITableViewController<ToDoDetailDatePickerDelegate>
{
     NSDate *doDate;
}
@property (nonatomic, strong) ToDoList *aTask;

@property (strong, nonatomic) IBOutlet UITextField *enterLocationTextfield;

@property (weak,nonatomic) MKLocalSearchResponse *results;

@property (assign) BOOL finished;

@end
