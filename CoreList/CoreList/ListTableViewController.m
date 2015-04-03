//
//  ListTableViewController.m
//  CoreList
//
//  Created by Keaton Swoboda on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ListTableViewController.h"
#import "CoreDataStack.h"
#import "ListItem.h"
#import "ModelViewController.h"



@interface ListTableViewController ()
{
    NSMutableArray *items;
    CoreDataStack *cdStack;
}
- (IBAction)addButton:(UIBarButtonItem *)sender;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cdStack = [CoreDataStack coreDataStackWithModelName:@"CoreListModel"];
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
    
    items = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    {
        [super viewWillAppear:animated];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"ListItem" inManagedObjectContext:cdStack.managedObjectContext];
        NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
        fetch.entity = entity;
        items = nil;
        items = [[cdStack.managedObjectContext executeFetchRequest:fetch error:nil] mutableCopy];
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
    ListItem *aItem = items[indexPath.row];
    cell.textLabel.text = aItem.item;
    
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
    if ([segue.identifier isEqualToString:@"ModelVCSegue"])
    {
        ModelViewController *modelVC =(ModelViewController *) [segue destinationViewController];
        
        modelVC.cdStack = cdStack;
        
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)addButton:(UIBarButtonItem *)sender
{
//    ListItem *aItem = [NSEntityDescription insertNewObjectForEntityForName:@"ListItem" inManagedObjectContext:cdStack.managedObjectContext];
//    [items addObject:aItem];
    
}
@end
