//
//  LocationCell.h
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabl;
@property (weak, nonatomic) IBOutlet UILabel *degreeLabel;

@end