//
//  MainViewController.m
//  Reddit Browser
//
//  Created by Glauber Lima on 13/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import "MainViewController.h"
#import "RedditPost.h"
#import "UIRedditPostTableViewCell.h"
#import "YTPlayerViewController.h"
#import "RedditAPI.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ViewPictureController.h"

@interface MainViewController ()

@end

@implementation MainViewController

NSString *_videoId;

NSArray *_posts;

int _selectedRow;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    RedditAPI *api = [[RedditAPI alloc] init];
    [api retrievePostsAsyncWithCompletion:^(NSArray *posts) {
        _posts = posts;
        [self.tableView reloadData];
    }];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_posts count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    static NSString *cellIdentifier = @"MyCell";
//    
//    UIRedditPostTableViewCell *cell = (UIRedditPostTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    
//    RedditPost *post = _posts[indexPath.row];
//    
//    
//    NSData *data =[NSData dataWithContentsOfURL:post.imageUrl];
//    
//    
//    cell.title.text = post.title;
//    
//    
//    cell.thumbnail.image = [UIImage imageWithData:data];
//    
//    cell.subreddit.text = post.subreddit;
//    
//    return cell;
    
    
    
    static NSString *cellIdentifier = @"MyCell";
    
    UIRedditPostTableViewCell *cell = (UIRedditPostTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    RedditPost *post = _posts[indexPath.row];
    
    
    //NSData *data =[NSData dataWithContentsOfURL:post.imageUrl];
    
    
    cell.title.text = post.title;
    
    
    //cell.thumbnail.image = [UIImage imageWithData:data];
    
    [cell.thumbnail sd_setImageWithURL:post.imageUrl];
    
    
    //[imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.domain.com/path/to/image.jpg"]
      //           placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    cell.subreddit.text = post.subreddit;
    
    return cell;

    
    
    

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"PlayVideo"]) {
        
        
        YTPlayerViewController *vc = [segue destinationViewController];
        vc.videoId = _videoId;
        
    }
    else {
        
        ViewPictureController *c = [segue destinationViewController];
        
        RedditPost *post = _posts[_selectedRow];
        
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(queue, ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [c.imageView sd_setImageWithURL:post.imageUrl];
            });
        
            
        });

        
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RedditPost *post = _posts[indexPath.row];
    
    _selectedRow = (int)indexPath.row;
    
    if(post.videoId != nil) {
        
        _videoId = post.videoId;
        
        [self performSegueWithIdentifier:@"PlayVideo" sender:self];

    }
    else {
        [self performSegueWithIdentifier:@"DisplayPicture" sender:self];
    }

    
    
}

@end
