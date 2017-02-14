//
//  RedditPost.h
//  Reddit Browser
//
//  Created by Glauber Lima on 13/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIRedditPostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *subreddit;


@end
