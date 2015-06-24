//
//  VideoSectionViewController.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-06-17.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "VideoSectionViewController.h"
@import MediaPlayer;

@implementation VideoSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Videos";
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    [self startVideoPlayback];
    
}

- (void) startVideoPlayback {
    
    NSString* videoURLString = @"http://videos.contentful.com/1oq1lgnwupsh/Z64eJTxpq8OM4Ws20GckE/15fbbe2cb432a46f0941dd9dc556886b/Ariana_Grande_-_Break_Free_ft._Zedd.mp4";
    
    NSURL *videoURL = [NSURL URLWithString:videoURLString ];
    
    MPMoviePlayerViewController *movie = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:movie];
    
    [self presentMoviePlayerViewControllerAnimated:movie];
}
@end
