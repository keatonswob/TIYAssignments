//
//  DatePickerViewController.h
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/29/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoDetailTableViewController.h"

@interface DatePickerViewController : UIViewController

@property (strong, nonatomic) NSDate *dueDate;
@property (strong, nonatomic) id <ToDoDetailDatePickerDelegate> delegate;


@end
