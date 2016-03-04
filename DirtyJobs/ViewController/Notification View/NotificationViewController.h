//
//  NotificationViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/4/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICSDrawerController.h"


@protocol NotificationViewControllerDelegate <NSObject>

- (void)getData:(NSArray*)details;

@end

@interface NotificationViewController : UIViewController <UITableViewDataSource,  UITableViewDelegate, ICSDrawerControllerChild, ICSDrawerControllerPresenting>

- (IBAction)btnMenu:(id)sender;


@property (strong, nonatomic) NSDictionary *notificationDic;

@property (strong, nonatomic) NSArray *notifArr;

@property (strong, nonatomic) NSArray *testArr;

@property (weak, nonatomic) IBOutlet UITableView *tblView;

@property (weak, nonatomic) ICSDrawerController *drawer;

@property (nonatomic, assign) id<NotificationViewControllerDelegate>delegate;


@end
