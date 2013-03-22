//
//  WhereamiViewController.m
//  Whereami
//
//  Created by kgaddy on 3/21/13.
//  Copyright (c) 2013 com.kgaddy. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        //create the location amanager object.
        locationManager = [[CLLocationManager alloc]init];
        [locationManager setDelegate:self];
        
        //we want it to be very accurate
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        //start looking imedatly
        //[locationManager startUpdatingLocation];
        
    }
    return self;
    
}
-(void)dealloc
{
    //tell the location manager to stop sending messages.
    [locationManager setDelegate:nil];
}

-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //we need to zoom here.
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

-(void)locationManager: (CLLocationManager *)manager
    didUpdateToLocation: (CLLocation *)newLocation
           fromLocation: (CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}



@end
