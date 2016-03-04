//
//  SorryBidViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/5/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "ViewController.h"

#import "NotificationViewController.h"


@interface SorryBidViewController : ViewController <NotificationViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *lblSorry;


- (IBAction)btnBack:(id)sender;

@end
