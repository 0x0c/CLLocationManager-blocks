//
//  MTAnnotation.h
//  address_exchanger
//
//  Created by 暁 松田 on 12/02/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MTAnnotation : NSObject <MKAnnotation>
{
	CLLocationCoordinate2D coordinate_;
	NSString *title_;
	NSString *subtitle_;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
