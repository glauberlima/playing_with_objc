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

@interface MainViewController ()

@end

@implementation MainViewController

NSString *_videoId;

NSMutableArray *_posts;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _posts = [[NSMutableArray alloc] init];
    
    
    
    //static NSString *url_string = @"https://api.reddit.com/r/videos.json";
    static NSString *url_string = @"https://api.reddit.com/hot.json";
    
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@", json);
    
    // TODO: Mudar para NSURLSession
    // auto layout
    // AFNetworking
            // Cocoa Pods (gerenciador de dependencia) DONE
    // dispatch async
    
    
    
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
        
        
        [_posts addObject:postA];
        
        
        
    }
    

    
    
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
    
    
    static NSString *cellIdentifier = @"MyCell";
    
    UIRedditPostTableViewCell *cell = (UIRedditPostTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    RedditPost *post = _posts[indexPath.row];
    
    
    NSData *data =[NSData dataWithContentsOfURL:post.imageUrl];
    
    
    cell.title.text = post.title;
    
    
    cell.thumbnail.image = [UIImage imageWithData:data];
    
    cell.subreddit.text = post.subreddit;
    
    return cell;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"PlayVideo"]) {
        
        
        YTPlayerViewController *vc = [segue destinationViewController];
        vc.videoId = _videoId;
        
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RedditPost *post = _posts[indexPath.row];
    
    if(post.videoId != nil) {
        
        _videoId = post.videoId;
        
        [self performSegueWithIdentifier:@"PlayVideo" sender:self];

    }

    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
