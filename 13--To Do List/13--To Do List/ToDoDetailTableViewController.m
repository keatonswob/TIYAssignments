//
//  ToDoDetailTableViewController.m
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/27/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ToDoDetailTableViewController.h"
#import "ToDoList.h"
#import "DatePickerViewController.h"
#import "LocationTableViewController.h"

@import MapKit;

@interface ToDoDetailTableViewController () <UITextFieldDelegate, CLLocationManagerDelegate>
{
    NSMutableArray *doToList;
    NSDateFormatter *formattedDate;
  
    CLLocationManager *locationManager;
    MKLocalSearch *localSearch;
}

-(IBAction)toDoButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *toDoButton;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UITextField *detailTextField;
@property (strong, nonatomic) IBOutlet UIButton *finishedButton;
@property (strong, nonatomic) IBOutlet UILabel *otherLocationLabel;
@property (strong, nonatomic) IBOutlet UILabel *addyLocationLabel;
@property (strong, nonatomic) IBOutlet UITextView *noteTextView;



@end

@implementation ToDoDetailTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    doToList = [[NSMutableArray alloc] init];
    
    formattedDate = [[NSDateFormatter alloc] init];
    
    //
    // 4. Once created, the formatString you see below needs to be set as the date formatter's dateFormat
    //
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMMddyyyy"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    
    [formattedDate setDateFormat:formatString];
    
    self.detailTextField.text = self.aTask.taskName;
    self.finishedButton.selected = self.aTask.done;
    
    self.noteTextView.text = self.aTask.notes;
    if (self.aTask.dateNote)
    {
        self.dateLabel.text = self.aTask.dateNote;
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.otherLocationLabel.text = self.aTask.bizName;
    self.addyLocationLabel.text = self.aTask.address;
    NSLog(@"%@", self.aTask.bizName);
  
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.aTask.notes = self.noteTextView.text;
    self.aTask.dateNote = self.dateLabel.text;
}
#pragma mark - Table view data source



// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    ToDoList *item = doToList[indexPath.row];
//    
//    
//    return item.done;
//
//}

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

 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowDestinationDatePickerSegue"])
        
    {
        UINavigationController *datePickernavC = [segue destinationViewController];
        
        DatePickerViewController *datePickerVC = [datePickernavC viewControllers][0];
        
        
        datePickerVC.delegate = self;
        
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""] || [textField.text isEqualToString:@""])
    {
        if (textField == self.enterLocationTextfield && ![textField.text isEqualToString:@""])
        {
            [self configureLocationManager];
        }
        [textField resignFirstResponder];
        rc = YES;
    }
    return rc;
}

- (void)destinationDateWasChosen:(NSDate *)destinationDate
{
   
    
    self.dateLabel.text = [formattedDate stringFromDate:destinationDate];
    
}

- (void)configureLocationManager
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!locationManager)
        {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
            
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
            {
                [locationManager requestWhenInUseAuthorization];
            }
            else
            {
                [self enableLocationManager:YES];
            }
        }
        
    }
    else
    {
        
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        
    }
    else
    {
        [self enableLocationManager:YES];
    }
}

- (void)enableLocationManager:(BOOL)enable
{
    if (locationManager)
    {
        if (enable) {
            [locationManager stopUpdatingLocation];
            [locationManager startUpdatingLocation];
        }
        else
        {
            [locationManager stopUpdatingLocation];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error != kCLErrorLocationUnknown)
    {
        [self enableLocationManager:NO];
    }
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self enableLocationManager:NO];
    
    CLLocation *location = [locations lastObject];
    
    MKCoordinateRegion userLocation = MKCoordinateRegionMakeWithDistance(location.coordinate, 1500.00, 1500.00);
    
    [self performSearch:userLocation];
    
    
    //            NSLog(@"%f",location.coordinate.latitude);
    //            NSLog(@"%f",location.coordinate.longitude);
    
    
}


-(void)performSearch:(MKCoordinateRegion)aRegion
{
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = self.enterLocationTextfield.text;
    request.region = aRegion;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (error != nil) {
            [[[UIAlertView alloc] initWithTitle:@"Map Error"
                                        message:[error localizedDescription]
                                       delegate:nil
                              cancelButtonTitle:@"OK"otherButtonTitles:nil] show];
            return;
        }
        
        if ([response.mapItems count] == 0) {
            [[[UIAlertView alloc] initWithTitle:@"No Results"
                                        message:nil
                                       delegate:nil
              
                              cancelButtonTitle:@"OK"otherButtonTitles:nil] show];
            return;
        }
        
        
        
        
        self.results = response;
        
        
        
        
        
        
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *navC = [storyboard instantiateViewControllerWithIdentifier:@"LocationNavController"];
        
        LocationTableViewController *locationVC = [navC viewControllers][0];
        
        
        [locationVC setModalPresentationStyle:UIModalPresentationFullScreen];
        
        locationVC.locationsArray = response.mapItems;
        
        locationVC.aTask = self.aTask;
        
        [self presentViewController:navC animated:YES completion:nil];
        
        
        
        //          [locationVC.tableView reloadData];
        
        //          NSLog(@"%@",self.results);
    }];
    
    
}

#pragma mark - Action Handlers

-(IBAction)toDoButton:(UIButton *)sender
{
    
}


@end
