//
//  ViewController.m
//  CLDemo
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager startUpdatingLocation];
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [manager stopUpdatingLocation];
    
    MKCoordinateRegion visible = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 800.0, 800.0);
    MKCoordinateRegion mapVisible = [self.mapView regionThatFits:visible];
    [self.mapView setRegion:mapVisible animated:YES];
    
    MKPointAnnotation *pa = [[MKPointAnnotation alloc] init];
    pa.coordinate = newLocation.coordinate;
    pa.title = [NSString stringWithFormat:@"(%f, %f)", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
    [self.mapView addAnnotation:pa];
}

@end
