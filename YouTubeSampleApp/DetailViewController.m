//
//  DetailViewController.m
//  YouTubeSampleApp
//
//  Created by SQUARE-11 on 18/09/14.
//  Copyright (c) 2014 Mac-201. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize title , urlName ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ((UIButton *)[self.view viewWithTag:100]).frame = CGRectMake(0,self.view.frame.size.height - 36, 320, 36);
    self.screenNumber.text = self.title ;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlName]]];
//    NSURL *url = [NSURL URLWithString:self.urlName];
//    MPMoviePlayerController *moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:url];
//
//  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
//
//      moviePlayer.controlStyle=MPMovieControlStyleDefault;
//     moviePlayer.shouldAutoplay=YES;
//    [self.view addSubview:moviePlayer.view];
//   [moviePlayer setFullscreen:YES animated:YES];
}
- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    
    MPMoviePlayerController *player = [notification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    
    if ([player respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GotoLIst:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self.view removeFromSuperview];
}
@end
/*
{
NSURL *url=[[NSURL alloc] initWithString:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];
moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:url];

[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDonePressed:) name:MPMoviePlayerDidExitFullscreenNotification object:moviePlayer];

moviePlayer.controlStyle=MPMovieControlStyleDefault;
//moviePlayer.shouldAutoplay=NO;
[moviePlayer play];
[self.view addSubview:moviePlayer.view];
[moviePlayer setFullscreen:YES animated:YES];
}

- (void) moviePlayBackDonePressed:(NSNotification*)notification
{
    [moviePlayer stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerDidExitFullscreenNotification object:moviePlayer];
    
    
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [moviePlayer.view removeFromSuperview];
    }
    [moviePlayer release];
    moviePlayer=nil;
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    [moviePlayer stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
    
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [moviePlayer.view removeFromSuperview];
    }
}

@end
 */
