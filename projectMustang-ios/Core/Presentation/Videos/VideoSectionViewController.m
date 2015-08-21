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
    
    // sample call
    CDAConfiguration* config = [CDAConfiguration defaultConfiguration];
    config.server = @"preview.contentful.com";
    CDAClient* client = [[CDAClient alloc] initWithSpaceKey:@"1oq1lgnwupsh" accessToken:@"ea40f4d68e1983a625ac5330daaaaee3befeda5a26dc4da674ccee3b5dec4037" configuration: config];
    
    [client fetchEntriesMatching:@{ @"content_type": @"5q1GHJZHl6AKOyyIIcaY8s" }
                         success:^(CDAResponse *response, CDAArray *array) {
                             
                             CDAEntry* videoEntry = [array.items firstObject];
                             NSDictionary* videoDict = [videoEntry fields];
                             CDAAsset* asset = videoDict[@"url"];
                             NSURL *videoURL = [asset URL];
                             
                             MPMoviePlayerViewController *movie = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
                             
                             [[NSNotificationCenter defaultCenter] addObserver:self
                                                                      selector:@selector(playbackFinishedCallback:)
                                                                          name:MPMoviePlayerPlaybackDidFinishNotification
                                                                        object:movie];
                             
                             [self presentMoviePlayerViewControllerAnimated:movie];
                             
                             
                         } failure:^(CDAResponse *response, NSError *error) {
                             
                             
                             
                         }];
    
    
    

    
}
@end
