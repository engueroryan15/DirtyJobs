//
//  CongBidViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/5/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "ViewController.h"

#import "NotificationViewController.h"

@interface CongBidViewController : ViewController <NotificationViewControllerDelegate>


- (IBAction)btnBack:(id)sender;

- (IBAction)btnPayment:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *txtContent;

@property (weak, nonatomic) IBOutlet UILabel *lblContent;

@end
