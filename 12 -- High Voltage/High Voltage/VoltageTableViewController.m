//
//  VoltageTableViewController.m
//  High Voltage
//
//  Created by Keaton Swoboda on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "VoltageTableViewController.h"
#import "EnergyTableViewController.h"

#import "Energy.h"

@interface VoltageTableViewController ()<UIPopoverPresentationControllerDelegate>
{
    NSMutableArray *energyListed;
//    NSMutableArray *allEnergyTypes;
  
}



@end

@implementation VoltageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"High Voltage";
    
    energyListed = [[NSMutableArray alloc] init];
//    allEnergyTypes = [[NSMutableArray alloc] initWithObjects:@"Volts", @"Amps", @"Ohms", @"Watts", nil ];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//
//-(NSArray*)allEnergyTypes
//{
//    return [NSArray arrayWithArray:_allEnergyTypes];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [energyListed count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[energyListed objectAtIndex:indexPath.row] forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}



-(void)energyTypeWasChosen:(NSString *)chosentype
{
    NSDictionary *typesDictionary = @{@"Volts": @"VoltsCell", @"Amps": @"AmpsCell", @"Ohms": @"OhmsCell", @"Watts": @"WattsCell" };
    NSString *anIdentifier = [typesDictionary objectForKey:chosentype];
    [energyListed addObject:anIdentifier];
   
    
    
    [self.tableView reloadData];
    
    
}



//
//- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths
//              withRowAnimation:(UITableViewRowAnimation)animation

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

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowEnergyPopoverSegue"])
    {
       
        EnergyTableViewController *destVC = (EnergyTableViewController *)[segue destinationViewController];
        destVC.popoverPresentationController.delegate = self;
        NSArray *priorityTypes = [Energy allEnergyTypes];
        float contentHeight = 44.0f * [priorityTypes count];
        destVC.preferredContentSize = CGSizeMake(100.0f, contentHeight);
        
        destVC.delegate = self;
    }
}

#pragma mark - PopoverPresentationController delegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}








@end
