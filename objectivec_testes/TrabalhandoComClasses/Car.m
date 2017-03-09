//
//  Car.m
//  TrabalhandoComClasses
//
//  Created by Glauber Lima on 07/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//

#import "Car.h"

@implementation Car {
    double _odometer;
}

@synthesize model = _model;

-(void)drive {
    NSLog(@"Driving a %@. Vroooom!", self.model);
}

@end
