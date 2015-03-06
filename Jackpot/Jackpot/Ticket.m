//
//  Ticket.m
//  Jackpot
//
//  Created by Keaton Swoboda on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@interface Ticket()
{
    NSMutableArray *picks;
}

@end

@implementation Ticket

+ (instancetype)ticketUsingQuickPick
{
    Ticket *aTicket = [[Ticket alloc] init];
    for (int i = 0; i<6; i++)
    {
        [aTicket createPick];
    }
    return aTicket;
}

+(instancetype)ticketUsingArray:(NSArray *)winningNumbers
{
    Ticket *winningTicket = [[Ticket alloc] init];
    if (winningTicket)
    {
        [winningTicket createPicksWithArray:winningNumbers];
    }
    return winningTicket;
}



-(instancetype)init
{
    if (self = [super init])
    {
        picks = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *)description
{
  
    
    NSString *pickNumbers = [NSString stringWithFormat:@" %@ %@ %@ %@ %@ %@", picks[0], picks[1], picks[2], picks[3], picks[4], picks[5]];
  
    
    return pickNumbers;

}


- (void)createPick
{
    int pickInt = (rand() %52);
    NSNumber *aNumber = [NSNumber numberWithInt:pickInt];
    [picks addObject:aNumber];
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [picks sortUsingDescriptors:@[lowestToHighest]];
    
   
}

- (void)createPicksWithArray:(NSArray *)winningPicks
{
    picks = [winningPicks mutableCopy];
}


@end
