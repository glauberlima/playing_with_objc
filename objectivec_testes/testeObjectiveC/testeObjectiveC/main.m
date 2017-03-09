//
//  main.m
//  testeObjectiveC
//
//  Created by Glauber Lima on 07/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//



// main.m
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        double odometer = 9200.8;
//        int odometerAsInteger = (int)odometer;
//        
//        typedef struct {
//            unsigned char red;
//            unsigned char green;
//            unsigned char blue;
//        } Color;
//        
//        
//        
//        Color carColor;
//        
//        NSLog(@"red = %hhu", carColor.red);
//        
//        
//        int years[2] = {1981, 2017};
//        
//        for(int i=0;i<2;i++) {
//            NSLog(@"The year at index %d is %d", i, years[i]);
//        }
//        
//        
//        
//        
//        NSLog(@"You've driven %.1f miles", odometer);        // 9200.8
//        NSLog(@"You've driven %d miles", odometerAsInteger); // 9200
        
        int year = 1981;
        NSLog(@"%d", year);
        
        int* pointer;
        
        pointer = &year;
        
        NSLog(@"%d", *pointer);
        
        *pointer = 1990;
        
        NSLog(@"%d", year);
        
        
        
        
        
    }
    return 0;
}
