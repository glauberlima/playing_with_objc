//
//  RedditPost.h
//  Reddit Browser
//
//  Created by Glauber Lima on 13/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditPost : NSObject

@property NSString *title;
@property NSURL *imageUrl;
@property NSString *subreddit;
@property NSString *videoId;

@end
