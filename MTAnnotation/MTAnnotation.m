//
//  MTAnnotation.m
//  address_exchanger
//
//  Created by 暁 松田 on 12/02/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MTAnnotation.h"

@implementation MTAnnotation

@synthesize coordinate = coordinate_;
@synthesize title = title_;
@synthesize subtitle = subtitle_;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
	self = [super init];
	if (self) {
		coordinate_ = coordinate;
	}
	
	return self;
}

@end
