//
//  DetailViewController.h
//  YouTubeSampleApp
//
//  Created by SQUARE-11 on 18/09/14.
//  Copyright (c) 2014 Mac-201. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
@property (strong, nonatomic) NSString *urlName;
@property (strong, nonatomic) NSString *tittle ;
- (IBAction)GotoLIst:(id)sender;
@end
