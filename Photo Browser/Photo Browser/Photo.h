//
//  Photo.h
//  Photo Browser
//
//  Created by Glauber Lima on 21/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, weak) NSURL *url;
@property (nonatomic, weak) NSString *title;

@end
