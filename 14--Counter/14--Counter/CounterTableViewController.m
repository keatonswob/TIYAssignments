//
//  CounterTableViewController.m
//  14--Counter
//
//  Created by Keaton Swoboda on 3/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "CounterTableViewController.h"
#import "CounterList.h"
#import "CounterTableViewCell.h"


@interface CounterTableViewController ()<UITextFieldDelegate>
{
    NSMutableArray *countList;
    
    
}

-(IBAction)addCell:(UIBarButtonItem *)sender;
-(IBAction)clearButton:(UIBarButtonItem *)sender;
-(IBAction)addCounterButton:(UIButton *)sender;
-(IBAction)minusCounterButton:(UIButton *)sender;

@end

@implementation CounterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    countList =[[NSMutableArray alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CounterTableViewCell" bundle:nil] forCellReuseIdentifier:@"CounterCell"];
    
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [countList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CounterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CounterCell" forIndexPath:indexPath];
   
    
    
    return cell;
}

- (void)updateLabel:(UILabel *)label withCount:(NSInteger)count
{
    
    label.text = [NSString stringWithFormat:@"%2ld", (long)count];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action Handlers
-(IBAction)addCell:(UIBarButtonItem *)sender
{
    CounterList *countCell = [[CounterList alloc] init];
    [countList addObject:countCell];
    [self.tableView reloadData];
}

-(IBAction)addCounterButton:(UIButton *)sender
{
    UIView *contentView = [sender superview];
    CounterTableViewCell *cell = (CounterTableViewCell *)[contentView superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    CounterList *aCounter = countList[path.row];
    aCounter.currentCount++;
    [self updateLabel:cell.countLabel withCount:aCounter.currentCount];
    
}
-(IBAction)minusCounterButton:(UIButton *)sender
{
    UIView *contentView = [sender superview];
    CounterTableViewCell *cell = (CounterTableViewCell *)[contentView superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    CounterList *aCounter = countList[path.row];
    aCounter.currentCount--;
    [self updateLabel:cell.countLabel withCount:aCounter.currentCount];
    
}





@end
