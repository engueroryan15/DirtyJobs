//
//  BiddingViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/3/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BiddingDelegete <NSObject>

- (void)getData:(NSArray*)details;

@end


@interface BiddingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *arrService;


- (IBAction)btnBackHome:(id)sender;

@property (nonatomic, assign) id<BiddingDelegete>delegate;


@end
