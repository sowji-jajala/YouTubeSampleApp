//
//  MainModal.m
//  YouTubeSampleApp
//
//  Created by Mac-201 on 17/09/14.
//  Copyright (c) 2014 Mac-201. All rights reserved.
//

#import "MainModal.h"
static MainModal *instance =nil;
NSString *const youtubeSubscribedUrl=@"https://gdata.youtube.com/feeds/api/videos?v=2&alt=jsonc&author=etv&max-results=10";
@implementation MainModal

@synthesize videos , delegate ;

+(MainModal *)getInstance

{
    @synchronized(self)
    {
        if(instance==nil)
            
        {
             instance= [MainModal new];
            
        }
        
    }
    
    return instance;
    
}

-(void)startSampleProcess

{
    
    videos=[[NSMutableArray alloc] initWithCapacity:50];
    
    [self connectWithYoutube:youtubeSubscribedUrl];
    
}



-(void)connectWithYoutube:(NSString*) strUrl

{
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:youtubeSubscribedUrl]];

    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        NSDictionary *moviesList = [[responseObject objectForKey:@"data"] objectForKey:@"items"];
        self.allData = [[NSMutableArray alloc] init];
        for (NSDictionary *enumerateDict in moviesList)
        {
            [self.allData addObject:enumerateDict];

        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        
        NSLog(@"error occured:%@",[error localizedDescription]);
        
    }];
    
    [operation start];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self.delegate
     
                                   selector:@selector(loadData) userInfo:nil repeats:NO];
    
}


@end
