//
//  City.m
//  assessment2
//
//  Created by Iván Mervich on 7/31/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithName:(NSString *)name stateOrProvince:(NSString *)stateOrProvince
{
	self = [super init];

	self.name = name;
	self.stateOrProvince = stateOrProvince;
	self.image = [UIImage imageNamed:name];

	return self;
}

- (void)getWikipediaURL
{
	[self.delegate wikipediaURLForCity:self.name];
}

@end
