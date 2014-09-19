//
//  MainModal.h
//  YouTubeSampleApp
//
//  Created by Mac-201 on 17/09/14.
//  Copyright (c) 2014 Mac-201. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@protocol MainModalDelegate <NSObject>

@required
-(void)loadData;
@end



@interface MainModal : NSObject
{
    NSMutableData *receivedRawData;
    
    id<MainModalDelegate> delegate;
    
}
@property (nonatomic,retain) NSMutableArray *videos;
@property (nonatomic,retain) NSMutableArray *allData;

@property (nonatomic , strong) id delegate ;

-(void)startSampleProcess;

+(MainModal *)getInstance ;

@end
