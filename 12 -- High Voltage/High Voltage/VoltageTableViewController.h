//
//  VoltageTableViewController.h
//  High Voltage
//
//  Created by Keaton Swoboda on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VoltageTableViewControllerDelegate

-(void)energyTypeWasChosen:(NSString *)chosentype;

@end

@interface VoltageTableViewController : UITableViewController <VoltageTableViewControllerDelegate>
//{
//    NSArray*_allEnergyTypes;
//}
//
//-(NSArray*)allEnergyTypes;

@end
