//
//  CLLocationManager.m
//  address_exchanger
//
//  Created by 暁 松田 on 12/02/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CLLocationManager+blocks.h"

@implementation CLLocationManagerBlocks

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock
{
	self = [super init];
	if (self) {
		updateBlock_ = Block_copy(updateBlock);
		errorBlock_ = Block_copy(errorBlock);
	}
	
	return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	BOOL stop = NO;
	if (updateBlock_) {
		updateBlock_(manager, newLocation, oldLocation, &stop);
	}
	if (stop) {
		[manager stopUpdatingLocation];
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	if (errorBlock_) {
		errorBlock_(error);
	}
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
	
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
	return showHeadingCalibration_;
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
	
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
	
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
	
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
	
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
	
}

- (void)dealloc
{
	Block_release(updateBlock_);
	Block_release(errorBlock_);
	
	[super dealloc];
}

@end

@implementation CLLocationManager (Blocks)

@dynamic delegate_;

- (void)setDelegate_:(id)delegate_
{
	objc_setAssociatedObject(self, @"CLLocationManagerBlocks", delegate_, OBJC_ASSOCIATION_RETAIN);
}

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock
{
	self = [self init];
	if (self) {
		CLLocationManagerBlocks *blocksDelegate = [[CLLocationManagerBlocks alloc] initWithUpdateBlock:updateBlock errorBlock:errorBlock];
		self.delegate_ = blocksDelegate;
		[blocksDelegate release];
	}
	
	return self;
}

@end
