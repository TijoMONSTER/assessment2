//
//  City.h
//  assessment2
//
//  Created by Iván Mervich on 7/31/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property NSString *name;
@property NSString *stateOrProvince;

- (instancetype)initWithName:(NSString *)name stateOrProvince:(NSString *)stateOrProvince;

@end
