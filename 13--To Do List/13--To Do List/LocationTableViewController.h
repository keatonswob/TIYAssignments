//
//  LocationTableViewController.h
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/30/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoDetailTableViewController.h"
#import "ToDoTableViewCell.h"

@interface LocationTableViewController : UITableViewController

@property (nonatomic, strong) ToDoList *aTask;

@property (nonatomic, strong) NSArray *locationsArray;

@end
