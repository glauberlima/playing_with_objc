//
//  main.m
//  TutorialRys-Properties
//
//  Created by Glauber Lima on 07/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *honda = [[Car alloc]init];
        [honda startEngine];
        NSLog(@"Running: %d", honda.running);
        //        honda.running = YES;             // mesmo que [honda setRunning:YES]
//        NSLog(@"%d", honda.running);     // mesmo que [honda running]
        
        
    }
    return 0;
}
