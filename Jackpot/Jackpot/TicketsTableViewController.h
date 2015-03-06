//
//  TicketsTableViewController.h
//  Jackpot
//
//  Created by Keaton Swoboda on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TicketsTableViewControllerDelegate

- (void)winningTicketNumberWasChosen:(NSArray*)lottoWinningNumbers;

@end

@interface TicketsTableViewController : UITableViewController <TicketsTableViewControllerDelegate>
// tells that tickets table view controller is the delegate of the winning ticket view controller. it is the one recieving the data


@end
