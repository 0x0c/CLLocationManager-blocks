//
//  ViewController.m
//  CLLocationManager+blocks
//
//  Created by 暁 松田 on 12/02/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CLLocationManager+blocks.h"
#import "MTAnnotation.h"

@implementation ViewController

@synthesize mapView = mapView_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	mapView_.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	manager_ = nil;
	mapView_ = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc
{
	[manager_ release], manager_ = nil;
	[mapView_ release], mapView_ = nil;
	[super dealloc];
}

#pragma mark MKMapViewDelegate
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
	if (annotation == mapView.userLocation) {
		return nil;
	}
	static NSString *reuseIdentifier = @"pin";
	MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
	if (!pin) {
		pin = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier] autorelease];
	}
	
	pin.pinColor = MKPinAnnotationColorRed;
	pin.canShowCallout = YES;
	pin.animatesDrop = YES;
	
	return pin;
}

-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
	NSLog(@"show");
}

#pragma mark -
- (IBAction)getLocation:(id)sender
{
	manager_ = [[CLLocationManager alloc] initWithUpdateBlock:^(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop){
		MKCoordinateRegion cr = mapView_.region;
		cr.center = newLocation.coordinate;
		cr.span.latitudeDelta = 0.4;
		cr.span.longitudeDelta = 0.4;
		[mapView_ setRegion:cr animated:YES];
		
		[mapView_ removeAnnotations:mapView_.annotations];
		MTAnnotation *annotation = [[MTAnnotation alloc] initWithCoordinate:newLocation.coordinate];
		annotation.title = @"title";
		annotation.subtitle = @"subtitle";
		[mapView_ addAnnotation:annotation];
		[mapView_ selectAnnotation:annotation animated:YES];
		[annotation release];		
	} errorBlock:^(NSError *error){
		NSLog(@"%@",error);
	}];
	
	manager_.distanceFilter = 1.0;
	manager_.desiredAccuracy = kCLLocationAccuracyBest;
	[manager_ startUpdatingLocation];
}

@end
