//
//  Car.h
//  TutorialRys-Properties
//
//  Created by Glauber Lima on 07/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (getter=isRunning, readonly) BOOL running;

- (void)startEngine;
-(void)stopEngine;

@end
