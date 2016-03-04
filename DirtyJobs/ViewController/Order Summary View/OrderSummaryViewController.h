//
//  OrderSummaryViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/4/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderSummaryViewController : UIViewController



@property (weak, nonatomic) IBOutlet UILabel *lblJONumber;


@property (weak, nonatomic) IBOutlet UILabel *lblPersonalInfo;


@property (weak, nonatomic) IBOutlet UILabel *lblTypeOfService;

@property (weak, nonatomic) IBOutlet UILabel *lblPrice;


@property (weak, nonatomic) IBOutlet UILabel *lblTypeOfPayment;


- (IBAction)btnBack:(id)sender;



@end
