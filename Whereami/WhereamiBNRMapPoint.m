//
//  WhereamiBNRMapPoint.m
//  Whereami
//
//  Created by kgaddy on 3/22/13.
//  Copyright (c) 2013 com.kgaddy. All rights reserved.
//

#import "WhereamiBNRMapPoint.h"


@implementation WhereamiBNRMapPoint
@synthesize coordinate,title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self= [super init];
    if(self)
    {
        coordinate =c;
        [self setTitle:t];
    }
    return self;
}
-(id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"HomeTown"];
}

@end
