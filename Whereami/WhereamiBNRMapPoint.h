//
//  WhereamiBNRMapPoint.h
//  Whereami
//
//  Created by kgaddy on 3/22/13.
//  Copyright (c) 2013 com.kgaddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface WhereamiBNRMapPoint : NSObject <MKAnnotation>
{
    
}
//A new initilizer for the instance of BNRMappoint
-(id)initWithCoordinate: (CLLocationCoordinate2D)c title:(NSString *)t;

//This is the required property for MKAnnotation
@property (nonatomic,readonly) CLLocationCoordinate2D cordinate;

//this is the optional property
@property (nonatomic,copy)NSString *title;

@end
