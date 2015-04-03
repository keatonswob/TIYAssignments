//
//  ForecastTableViewController.h
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ForecastTableViewControllerDelegate

-(void)cityWasFound;
-(void)weatherWasFoundForCity;


@end

@interface ForecastTableViewController : UITableViewController<ForecastTableViewControllerDelegate>

@end
