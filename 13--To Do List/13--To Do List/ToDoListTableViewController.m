    //
//  ToDoListTableViewController.m
//  13--To Do List
//
//  Created by Keaton Swoboda on 3/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ToDoListTableViewController.h"

#import "ToDoTableViewCell.h"

#import "ToDoList.h"
#import "ToDoDetailTableViewController.h"


@interface ToDoListTableViewController ()<UITextFieldDelegate>
{
    ToDoTableViewCell *toDoCell;
    NSMutableArray *doList;
    UIRefreshControl *refreshControl;
    
}




-(IBAction)clearButton:(UIRefreshControl *)sender;

-(IBAction)addCell:(UIBarButtonItem *)sender;

-(IBAction)doneButton:(UIButton *)sender;







@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"To Do List";
    
    doList = [[NSMutableArray alloc] init];
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(clearButton:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;

    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [doList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    
    ToDoList *textName = doList[indexPath.row];
    
       cell.descriptionTextField.text = @"";
    
    if (textName)
    {
    
        if (textName.taskName)
        {
        cell.descriptionTextField.text = textName.taskName;
        
        }
        else
        {
        [cell.descriptionTextField becomeFirstResponder];
        }
    
 
    [cell.checkBoxButton setSelected:textName.done];
    }
    

    return cell;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [doList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""])
    {
        [textField resignFirstResponder];
        
        
        UIView *contentView = [textField superview];
        UITableViewCell *cell = (UITableViewCell *)[contentView superview];
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        ToDoList *anItem = doList[path.row];
        anItem.taskName = textField.text;
        
        rc = YES;
        
        
    }
    
    
    return rc;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{

        ToDoList *item = doList[indexPath.row];
        
    
    return item.done;
}


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
    if ([segue.identifier isEqualToString:@"detailButtonCellSegue"])
    {
        ToDoDetailTableViewController *todoDetailVC = [segue destinationViewController];
        ToDoTableViewCell *senderCell = (ToDoTableViewCell *)sender;
        NSIndexPath *path = [self.tableView indexPathForCell:senderCell];
        ToDoList *anItem = doList[path.row];
        anItem.taskName = senderCell.descriptionTextField.text;
        anItem.done = senderCell.checkBoxButton.selected;
        todoDetailVC.aTask = anItem;
        NSLog(@"a task:%@", anItem);
        NSLog(@"detail task: %@", todoDetailVC.aTask);
    }
}

- (void)delete:(id)sender
{
    
}


#pragma mark - Action handlers
//
//-(IBAction)checkBox:(UIButton *)sender
//{
// self.
//}
-(IBAction)addCell:(UIBarButtonItem *)sender
{
    ToDoList *doCell = [[ToDoList alloc] init];
    [doList addObject:doCell];
    
    NSUInteger index2 =[doList indexOfObject:doCell];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index2 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationAutomatic];
    
//    [self.tableView reloadData];
}

-(IBAction)clearButton:(UIRefreshControl *)sender
{
    NSMutableArray *indexPathsToRemove = [[NSMutableArray alloc] init];
    NSMutableArray *itemsToRemove = [[NSMutableArray alloc] init];
    
    for (ToDoList *anItem in doList)
    {
        if (anItem.done)
        {
            [itemsToRemove addObject:anItem];
            [indexPathsToRemove addObject:[NSIndexPath indexPathForRow:[doList indexOfObject:anItem] inSection:0]];
        }
    }
    
    [doList removeObjectsInArray:itemsToRemove];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToRemove withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [sender endRefreshing];
    
    
}
-(IBAction)doneButton:(UIButton *)sender
{
    UIView *contentView = [sender superview];
    UITableViewCell *cell = (UITableViewCell *)[contentView superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    ToDoList *anItem = doList[path.row];
    anItem.done = !anItem.done;
    [sender setSelected:anItem.done];
    
}



@end
