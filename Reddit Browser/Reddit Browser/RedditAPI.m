//
//  RedditAPI.m
//  Reddit Browser
//
//  Created by Glauber Lima on 21/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import "RedditAPI.h"
#import "RedditPost.h"

@implementation RedditAPI

- (void)retrievePostsAsyncWithCompletion:(void (^)(NSArray *))completion {
    
    static NSString *url_string = @"https://api.reddit.com/r/earthporn.json";
    
    NSMutableArray *posts = [[NSMutableArray alloc] init];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSLog(@"json: %@", json);
        
        NSArray *arrA = [json valueForKeyPath:@"data.children"];
        
        for(int i = 0; i < [arrA count]; i++) {
            
            NSDictionary *d = [arrA objectAtIndex:i];
            
            NSDictionary *arrB = [d valueForKey:@"data"];
            
            NSString *title = [arrB valueForKey:@"title"];
            NSString *url = [arrB valueForKey:@"thumbnail"];
            NSString *subreddit = [arrB valueForKey:@"subreddit"];
            
            NSString *domain = [arrB valueForKey:@"domain"];
            
            
            RedditPost *postA = [[RedditPost alloc] init];
            postA.title = title;
            postA.imageUrl = [NSURL URLWithString:url];
            postA.subreddit = subreddit;
            
            if([domain isEqualToString:@"youtube.com"]) {
                NSString * videoUrl =[arrB valueForKey:@"url"];
                
                postA.videoId = [videoUrl stringByReplacingOccurrencesOfString:@"https://www.youtube.com/watch?v=" withString:@""];
                
            }
            
            
            [posts addObject:postA];
            
        }
        
        
        
        
        if(completion) {
            NSArray *p = [posts copy]; // cria uma cópia imutável
            dispatch_async(dispatch_get_main_queue(), ^{
               completion(p);
            });

            
            
        }
        
    });
    
    
}

@end
