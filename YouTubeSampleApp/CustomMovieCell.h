//
//  CustomMovieCell.h
//  YouTubeSampleApp
//
//  Created by Mac-201 on 17/09/14.
//  Copyright (c) 2014 Mac-201. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMovieCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (strong, nonatomic) IBOutlet UILabel *titleName;
@property (strong, nonatomic) IBOutlet UILabel *uploadedTime;

@end
