//
//  MovieListTableView.m
//  YouTubeSampleApp
//
//  Created by Mac-201 on 17/09/14.
//  Copyright (c) 2014 Mac-201. All rights reserved.
//

#import "MovieListTableView.h"
#import "CustomMovieCell.h"

@interface MovieListTableView ()

@end

@implementation MovieListTableView

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    
//    if (etActivity)
//    {
//        [etActivity startAnimating];
//        
//    }
//    else
//    {
//        etActivity = [[ETActivityIndicatorView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-30, self.view.frame.size.height/2-30, 40, 40)];
//        etActivity.color = [UIColor blueColor];
//        [etActivity startAnimating];
//        [self.view addSubview:etActivity];
//    }

    modal= [MainModal getInstance];
    modal.delegate=self;
    [modal startSampleProcess];
    self.tableView.hidden = YES ;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [modal.allData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier1 = @"CustomCell";
    
    CustomMovieCell  *Cell = (CustomMovieCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier1];
    if (Cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomMovieCell" owner:self options:nil];
        Cell = [nib objectAtIndex:0];
        Cell.userInteractionEnabled=YES;
    }
    
    Cell.titleName.text = [[modal.allData objectAtIndex:indexPath.row] objectForKey:@"title"];
    Cell.uploadedTime.text = [[modal.allData objectAtIndex:indexPath.row] objectForKey:@"uploaded"];
    
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                           NSURL *imageURL = [NSURL URLWithString:[[[modal.allData objectAtIndex:indexPath.row] objectForKey:@"thumbnail"] objectForKey:@"hqDefault"]];
                           
                           __block NSData *imageData;
                           
                           dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                                         ^{
                                             imageData = [NSData dataWithContentsOfURL:imageURL];

                                             dispatch_sync(dispatch_get_main_queue(), ^{
                                                 Cell.thumbnailImage.image = [UIImage imageWithData:imageData];
                                             });
                                         });
                       });
    

return Cell;
    
}
-(void)loadData
{
    self.tableView.hidden = NO ;
    [self.tableView reloadData];
   // [etActivity stopAnimating];
}




#pragma mark - Table view delegate

 //In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSURL *url = [NSURL URLWithString:[[[modal.allData objectAtIndex:indexPath.row] objectForKey:@"player"] objectForKey:@"mobile"]];
//    MPMoviePlayerController *moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:url];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
//    
//    moviePlayer.controlStyle=MPMovieControlStyleDefault;
//    moviePlayer.shouldAutoplay=YES;
//    [self.view addSubview:moviePlayer.view];
//    [moviePlayer setFullscreen:YES animated:YES];
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    DetailViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}
- (DetailViewController *)viewControllerAtIndex:(NSUInteger)index
{
    
   
    DetailViewController *childViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    childViewController.index = index;
    childViewController.urlName = [[[modal.allData objectAtIndex:index] objectForKey:@"player"] objectForKey:@"mobile"];
    childViewController.title = [[modal.allData objectAtIndex:index] objectForKey:@"title"];;
    
    return childViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(DetailViewController *)viewController index];
    
    if (index == 0)
    {
        return nil;
    }
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(DetailViewController *)viewController index];
    
    index++;
    
    if (index == modal.allData.count)
    {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}



@end
