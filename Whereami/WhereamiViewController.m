//
//  WhereamiViewController.m
//  Whereami
//
//  Created by kgaddy on 3/21/13.
//  Copyright (c) 2013 com.kgaddy. All rights reserved.
//

#import "WhereamiViewController.h"
#import "WhereamiBNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    //create an instance of BNRmappoint
    WhereamiBNRMapPoint *mp = [[WhereamiBNRMapPoint alloc]initWithCoordinate:coord title:[locationTitleField text]];
    
    //add to map
    [worldView addAnnotation:mp];
    
    //zoom to this location
    MKCoordinateRegion region =MKCoordinateRegionMakeWithDistance(coord, 250, 240);
    [worldView setRegion:region animated:YES];
    
    //reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
}

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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //not yet implemented
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

-(void)locationManager: (CLLocationManager *)manager
    didUpdateToLocation: (CLLocation *)newLocation
           fromLocation: (CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    //how many seconds ago was this created?
    NSTimeInterval  t = [[newLocation timestamp] timeIntervalSinceNow];
    if(t<-180)
    {
        //this is cached data, keep looking
        return;
    }
    [self foundLocation:newLocation];
}



@end
