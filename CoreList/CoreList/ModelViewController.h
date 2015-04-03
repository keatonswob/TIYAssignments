//
//  ModelViewController.h
//  CoreList
//
//  Created by Keaton Swoboda on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"
#import "CoreDataStack.h"

@interface ModelViewController : UIViewController

@property(nonatomic, strong) CoreDataStack *cdStack;

@end
