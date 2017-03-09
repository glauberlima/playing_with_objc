//
//  RedditPost.h
//  Reddit Browser
//
//  Created by Glauber Lima on 13/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditPost : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSURL *imageUrl;
@property (nonatomic) NSString *subreddit;
@property (nonatomic) NSString *videoId;

@end
