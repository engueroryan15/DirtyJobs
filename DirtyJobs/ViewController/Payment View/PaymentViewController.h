//
//  PaymentViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "ViewController.h"

@interface PaymentViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *lblJONo;


@property (weak, nonatomic) IBOutlet UILabel *lblPersonalDetail;


@property (weak, nonatomic) IBOutlet UILabel *lblInfoDetail;

- (IBAction)btnBack:(id)sender;


@end
