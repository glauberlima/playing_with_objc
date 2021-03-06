//
//  Car.h
//  TutorialRys
//
//  Created by Glauber Lima on 07/02/17.
//  Copyright © 2017 Glauber Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (copy) NSString *model;

- (void)drive;

+ (void)setDefaultModel:(NSString *)aModel;

- (id)initWithModel:(NSString *)aModel;

@end
