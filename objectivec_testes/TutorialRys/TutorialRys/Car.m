//
//  Car.m
//  TutorialRys
//
//  Created by Glauber Lima on 07/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//

#import "Car.h"


static NSString *_defaultModel;

@implementation Car {
    // Private instance variables
    double _odometer;
}

-(id)initWithModel:(NSString *)aModel {
    self = [super init];
    if(self) {
        _model = [aModel copy];
        _odometer = 0;
    }
    return self;

   
}

-(id)init {
    return [self initWithModel:_defaultModel];
}

//@synthesize model = _model;    // Optional for Xcode 4.4+

+ (void) setDefaultModel:(NSString *)aModel {
    _defaultModel = [aModel copy];
}

+(void)initialize {
    if(self == [Car class]) {
        _defaultModel = @"Nissan Versa";
    }
}


- (void)drive {
    NSLog(@"Driving a %@. Vrooooom!", self.model);
}

@end
