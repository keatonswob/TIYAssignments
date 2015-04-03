//
//  WeatherItems.m
//  16-- Forecaster
//
//  Created by Keaton Swoboda on 3/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "WeatherItems.h"

@implementation WeatherItems


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _cityName = nil;
        _latObj = nil;
        _longObj = nil;
    }
    return self;
}

-(void)weatherForecast
{
    
    NSString *latString = self.latObj;
    NSString *longString = self.longObj;
    NSString *webNameString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/bbccadcbce0b757e56c6f14834bd1055/%@,%@", latString, longString];
    NSLog(@"%@", webNameString);
    NSURL *webName = [NSURL URLWithString:webNameString];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:webName];
    
    [dataTask resume];
    
    
    
}
#pragma mark - NSURLSession delegate

-(void) URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] initWithData:data];
        
    }
    else
    {
        [receivedData appendData:data];
    }
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download Successful.");
        NSDictionary *weatherInfo = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
        NSLog(@"%@", weatherInfo);
        NSDictionary *currently = [weatherInfo objectForKey:@"currently"];
        NSString *sumCondition = [currently objectForKey:@"summary"];
        NSString *curTemp = [currently objectForKey:@"currently"];
        self.currentTemp = curTemp;
        self.summary = sumCondition;
        
        
        
        
        
    }
    
}

@end
