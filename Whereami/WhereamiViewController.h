//
//  WhereamiViewController.h
//  Whereami
//
//  Created by kgaddy on 3/21/13.
//  Copyright (c) 2013 com.kgaddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface WhereamiViewController : UIViewController
<CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}


@end
