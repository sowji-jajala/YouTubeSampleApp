//
//  MovieListTableView.h
//  YouTubeSampleApp
//
//  Created by Mac-201 on 17/09/14.
//  Copyright (c) 2014 Mac-201. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModal.h"
#import "DetailViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "ETActivityIndicatorView.h"
@interface MovieListTableView : UITableViewController<MainModalDelegate , UIPageViewControllerDataSource>
{
    MainModal *modal;
    ETActivityIndicatorView * etActivity;

}
@property (strong, nonatomic) UIPageViewController *pageController;

@end
