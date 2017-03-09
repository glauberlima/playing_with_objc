//
//  main.m
//  OOP-Tests
//
//  Created by Glauber Lima on 08/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ship.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        Ship *s = [[Ship alloc]init];
        [s shoot];
        [s move];
        
        Vehicle *v = s;
        [v move];
                
        
        
    }
    return 0;
}
