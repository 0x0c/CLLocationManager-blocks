//
//  ViewController.h
//  CLLocationManager+blocks
//
//  Created by 暁 松田 on 12/02/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
	CLLocationManager *manager_;
	MKMapView *mapView_;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
