//
//  ToDoList.h
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoList : NSObject

@property (strong, nonatomic) NSString *taskName;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *bizName;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *dateNote;
@property (assign) BOOL done;

@end
