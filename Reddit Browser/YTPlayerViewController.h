//
//  YTPlayerViewController.h
//  Reddit Browser
//
//  Created by Glauber Lima on 14/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface YTPlayerViewController : UIViewController

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@property NSString *videoId;

@end
