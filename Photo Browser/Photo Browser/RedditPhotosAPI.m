//
//  RedditPhotosAPI.m
//  Photo Browser
//
//  Created by Glauber Lima on 21/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import "RedditPhotosAPI.h"
#import "Photo.h"

@implementation RedditPhotosAPI


- (void)downloadTaskWithCompletionHandler:(void (^)(NSArray *))completionHandler {
    
    // obter json do reddit, gerar o array do tipo "Photo" e executar o handler
    
    Photo *p1 = [[Photo alloc] init];
    p1.title = @"titulo 1";
    p1.url = [NSURL URLWithString:@"http://teste.com/img.jpg"];
    
    Photo *p2 = [[Photo alloc] init];
    p2.title = @"titulo 2";
    p2.url = [NSURL URLWithString:@"http://teste.com/img.jpg"];
    
    
    NSMutableArray *posts = [[NSMutableArray alloc] init];
    [posts addObject:p1];
    [posts addObject:p2];
   
   
    completionHandler(posts);
}

@end
