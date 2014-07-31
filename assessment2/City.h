//
//  City.h
//  assessment2
//
//  Created by Iván Mervich on 7/31/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CityDelegate

- (void)wikipediaURLForCity:(NSString *)cityName;

@end

@interface City : NSObject

@property id <CityDelegate> delegate;

@property NSString *name;
@property NSString *stateOrProvince;
@property UIImage *image;


- (instancetype)initWithName:(NSString *)name stateOrProvince:(NSString *)stateOrProvince;

- (void)getWikipediaURL;

@end
