//
//  EnergyTableViewController.h
//  High Voltage
//
//  Created by Keaton Swoboda on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoltageTableViewController.h"

@interface EnergyTableViewController : UITableViewController

@property (strong, nonatomic) id <VoltageTableViewControllerDelegate> delegate;

@end
