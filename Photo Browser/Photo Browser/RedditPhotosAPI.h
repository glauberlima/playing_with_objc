//
//  RedditPhotosAPI.h
//  Photo Browser
//
//  Created by Glauber Lima on 21/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditPhotosAPI : NSObject

- (void)downloadTaskWithCompletionHandler:(void (^)(NSArray * photos))completionHandler;

@end
