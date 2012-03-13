//
//  CLLocationManager.h
//  address_exchanger
//
//  Created by 暁 松田 on 12/02/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManagerBlocks : NSObject <CLLocationManagerDelegate>
{
	BOOL showHeadingCalibration_;
	void (^updateBlock_)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop);
	void (^errorBlock_)(NSError *error);
}

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock;

@end

@interface CLLocationManager (Blocks)

- (id)initWithUpdateBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))updateBlock errorBlock:(void (^)(NSError *error))errorBlock;

@end
