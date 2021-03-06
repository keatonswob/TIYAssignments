//
//  ForecastTableViewController.m
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ForecastTableViewController.h"
#import "ZipCodeViewController.h"
#import "LocationCell.h"
#import "City.h"
#import "Weather.h"
#import "NetworkManager.h"

@interface ForecastTableViewController ()
{
    NSMutableArray *cities;
}



@end

@implementation ForecastTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cities = [[NSMutableArray alloc] init];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [cities count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];

    

    City *item = cities [indexPath.row];
    

    
    
    cell.cityLabel.text = item.name;
    cell.degreeLabel.text = [NSString stringWithFormat:@"%f", item.currentWeather.temperature];
    cell.weatherLabl.text = item.currentWeather.summary;
    
    
    
    
    
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddCitySegue"])
    {
        UINavigationController *navC = [segue destinationViewController];
        ZipCodeViewController *zipcodeVC = [navC viewControllers][0];
        zipcodeVC.cities = cities;
    }
}



@end
