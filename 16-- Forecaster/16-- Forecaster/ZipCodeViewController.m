//
//  ZipCodeViewController.m
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ZipCodeViewController.h"
#import "WeatherItems.h"

@interface ZipCodeViewController ()<NSURLSessionDataDelegate>
{
    NSMutableData *receiveData;
}

@property (weak, nonatomic) IBOutlet UITextField *zipCode;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancel;
@property (weak, nonatomic) IBOutlet UIButton *findCity;


@end

@implementation ZipCodeViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.prompt = @"Please enter a Zip Code to find current weather conditions.";
    self.navigationItem.title = @"Add City";
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action Handlers
- (IBAction)cancel:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)findCity:(UIButton *)sender
{

        NSString *zipCodeText= self.zipCode.text;
        NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:%@&sensor=false", zipCodeText];
    
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
        
        [dataTask resume];
   
        
    
    
}
#pragma mark - NSURLSession delegate

-(void) URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receiveData)
    {
        receiveData = [[NSMutableData alloc] initWithData:data];
        
    }
    else
    {
        [receiveData appendData:data];
    }
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        WeatherItems *weatherItems = [[WeatherItems alloc] init];
        NSLog(@"Download Successful.");
        NSDictionary *cityInfo = [NSJSONSerialization JSONObjectWithData:receiveData options:0 error:nil];
        NSArray *results = [cityInfo objectForKey:@"results"];
        NSDictionary *locInfo = results [0];
        NSArray *addyComponents = [locInfo objectForKey:@"address_components"];
        NSDictionary *locationInfo = addyComponents [1];
        NSDictionary *geometry = [locInfo objectForKey:@"geometry"];
        NSDictionary *latlngLocation = [geometry objectForKey:@"location"];
        NSString *latInfo = [latlngLocation objectForKey:@"lat"];
        NSString *lngInfo = [latlngLocation objectForKey:@"lng"];
        NSString *cityName = [locationInfo objectForKey:@"long_name"];
        weatherItems.latObj = latInfo;
        weatherItems.longObj = lngInfo;
        weatherItems.cityName = cityName;
        
        
        [self.cities addObject:weatherItems];
      
        
        [weatherItems weatherForecast];
        
         [self dismissViewControllerAnimated:YES completion:nil];
    }
   
}

@end
