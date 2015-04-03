//
//  FriendDetailViewController.m
//  GitHubFreinds
//
//  Created by Keaton Swoboda on 3/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FriendDetailViewController.h"
#import "FriendCell.h"

@interface FriendDetailViewController ()<UITableViewDelegate, UITableViewDataSource, NSURLSessionDataDelegate>
{
    NSArray *repos;
    NSMutableData *recievedData;
    UITableView *reposTV;
    
}

@end

@implementation FriendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    NSString *usernameInfo = [self.friendInfo objectForKey:@"login"];
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", usernameInfo];
    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSData *responseDate = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    repos = [NSJSONSerialization JSONObjectWithData:responseDate options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"%@", repos);
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    [dataTask resume];
    
    
    UILabel *location = [[UILabel alloc] initWithFrame:CGRectMake(10, 74, 300, 40)];
    CGFloat emailY = location.frame.origin.y + location.frame.size.height + 10;
    location.textAlignment = NSTextAlignmentCenter;
    location.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:location];
    
    UILabel *email = [[UILabel alloc] initWithFrame:CGRectMake(10, emailY, 300, 40)];
    email.textAlignment = NSTextAlignmentCenter;
    email.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:email];
    
    

    email.text = [self.friendInfo objectForKey:@"email"];
    location.text = [self.friendInfo objectForKey:@"location"];
    
    CGFloat reposTVY = email.frame.origin.y + email.frame.size.height + 10;
    CGFloat reposTVWdith = self.view.frame.size.width;
    CGFloat reposTVHeight = self.view.frame.size.height - reposTVY;
    reposTV = [[UITableView alloc] initWithFrame:CGRectMake(0, reposTVY, reposTVWdith, reposTVHeight)];
    [self.view addSubview:reposTV];
    
    
    [reposTV registerClass:[FriendCell class] forCellReuseIdentifier:@"RepoCell"];
    
    reposTV.delegate = self;
    reposTV.dataSource = self;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [repos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RepoCell" forIndexPath:indexPath];
    NSDictionary *repoInfo = repos [indexPath.row];
    cell.textLabel.text = [repoInfo objectForKey:@"name"];
   
    
    return cell;
}

#pragma mark - NSURLSessionData delegate
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}
-(void) URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!recievedData)
    {
        recievedData= [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        [recievedData appendData:data];
    }
}
-(void) URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download Successful.");
        repos = [NSJSONSerialization JSONObjectWithData:recievedData options:0 error:nil];
        [reposTV reloadData];
    }
}


@end


















































