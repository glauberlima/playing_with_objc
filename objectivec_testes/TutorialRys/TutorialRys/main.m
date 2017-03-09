//
//  main.m
//  TutorialRys
//
//  Created by Glauber Lima on 07/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        
//        [Car setDefaultModel:@"Nissan Versa"];
//    
//        Car *toyota = [[Car alloc] init];
//        
//        [toyota setModel:@"Toyota Corolla"];
//        NSLog(@"Created a %@",[toyota model]);
//        
//        toyota.model = @"Toyota Camry";
//        NSLog(@"Changed the car to a %@", toyota.model);
//        
//        [toyota drive];
        
        Car *nissan = [[Car alloc] init];
        NSLog(@"Created a %@", [nissan model]);
        
        Car *chevy = [[Car alloc] initWithModel:@"Chevy Corvette"];
        NSLog(@"Created a %@, too.", chevy.model);
        
        
        
        
    }
    return 0;
}
