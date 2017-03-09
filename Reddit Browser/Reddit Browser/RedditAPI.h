//
//  RedditAPI.h
//  Reddit Browser
//
//  Created by Glauber Lima on 21/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditAPI : NSObject

- (void) retrievePostsAsyncWithCompletion:(void (^)(NSArray*  posts))completion;

@end
