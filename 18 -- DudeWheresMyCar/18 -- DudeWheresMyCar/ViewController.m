//
//  ViewController.m
//  18 -- DudeWheresMyCar
//
//  Created by Keaton Swoboda on 3/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "Location.h"



@import CoreLocation;
@import MapKit;

#define MAP_DISPLAY_SCALE 0.5 *1609.344
#define kPinLocationsKey @"aLocation"

@interface ViewController ()<CLLocationManagerDelegate, UITextFieldDelegate>
{
    CLLocationManager*locationManager;
    
    CLGeocoder *geocoder;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pinCurrentItem;
@property (weak, nonatomic) IBOutlet UITextField *textFielf;
@property (strong, nonatomic) Location *aLocation;
- (IBAction)pinCurrentLocation:(UIBarButtonItem *)sender;
- (IBAction)treashCurrentPin:(UIBarButtonItem *)sender;


@end

@implementation ViewController
{
    NSMutableArray *pinLocations;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.textFielf.delegate = self;
    [self loadLocationData];
    
    
    
    if (!self.aLocation)
    {
        [self configureLocationManager];
    }
    else
    {
        [self configureMapView];
        [self configurePin];
    }
    
    
    
    


    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configureMapView
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance([self.aLocation coordinate], MAP_DISPLAY_SCALE, MAP_DISPLAY_SCALE);
    [self.mapView setRegion:viewRegion];
    
}
-(void)configurePin
{
    [self.mapView addAnnotation:self.aLocation];
}
-(void)loadLocationData
{
    NSData *locationData = [[NSUserDefaults standardUserDefaults] objectForKey:kPinLocationsKey];
    if (locationData)
    {
        self.aLocation = [NSKeyedUnarchiver unarchiveObjectWithData:locationData];
    }
    else
    {
        self.aLocation = nil;
    }
}

- (void)saveCityData
{
    NSData *locationData = [NSKeyedArchiver archivedDataWithRootObject:self.aLocation];
    [[NSUserDefaults standardUserDefaults] setObject:locationData forKey:kPinLocationsKey];
}



-(void)dropPin
{
    [self.mapView addAnnotation:self.aLocation];
}

-(void)configureLocationManager
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!locationManager)
        {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
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
        [self.pinCurrentItem setEnabled:NO];
    }
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.pinCurrentItem setEnabled:NO];
    }
    else
    {
        [self enableLocationManager:YES];
    }
}

-(void)enableLocationManager:(BOOL)enable
{
    if (locationManager)
    {
        if (enable)
        {
            [locationManager stopUpdatingLocation];
            [locationManager startUpdatingLocation];
        }
        else
        {
            [locationManager stopUpdatingLocation];
        }
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *loca = [locations lastObject];


    [self enableLocationManager:NO];

    self.aLocation = [[Location alloc] initWithCoordinate:loca.coordinate pinDescription:self.aLocation.name];
    [self configureMapView];
    
    
    [self.pinCurrentItem setEnabled:YES];
    
         

}
- (IBAction)pinCurrentLocation:(UIBarButtonItem *)sender
{
    [self dropPin];
    self.aLocation.name = [NSString stringWithFormat:@"%@", self.textFielf.text];
    [self.textFielf resignFirstResponder];
    
    
}
- (IBAction)treashCurrentPin:(UIBarButtonItem *)sender
{

    [self.mapView removeAnnotation:self.aLocation];
    self.aLocation = nil;
    [self configureLocationManager];
    
}



@end
