//
//  ToDoTableViewCell.h
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *checkBoxButton;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end
