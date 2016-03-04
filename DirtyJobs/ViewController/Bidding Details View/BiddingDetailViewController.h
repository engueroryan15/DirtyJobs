//
//  BiddingDetailViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/3/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BiddingViewController.h"

@interface BiddingDetailViewController : UIViewController <UITextFieldDelegate, BiddingDelegete>


@property (strong, nonatomic) IBOutlet UIView *viewDatePicker;

- (IBAction)btnBackButton:(id)sender;

- (IBAction)btnDone:(id)sender;

- (IBAction)btnCancel:(id)sender;

- (IBAction)silderAction:(id)sender;



- (IBAction)btnCashActionCheck:(id)sender;

- (IBAction)btnCashActionUnCheck:(id)sender;



- (IBAction)btnCreditCardActionCheck:(id)sender;

- (IBAction)btnCreditCardActionUnCheck:(id)sender;

- (IBAction)btnPlanceBid:(id)sender;





@property (strong, nonatomic) NSString *titleStr;

@property (weak, nonatomic) IBOutlet UIButton *btnCashCheck;

@property (weak, nonatomic) IBOutlet UIButton *btnCashUnCheck;

@property (weak, nonatomic) IBOutlet UIButton *btnCreditCardCheck;

@property (weak, nonatomic) IBOutlet UIButton *btnCreditCardUnCheck;



@property (weak, nonatomic) IBOutlet UILabel *lblTitleNav;


@property (weak, nonatomic) IBOutlet UITextField *txtDeadline;

@property (weak, nonatomic) IBOutlet UIDatePicker *pickerDate;

@property (weak, nonatomic) IBOutlet UISlider *sliderAmout;

@property (weak, nonatomic) IBOutlet UILabel *lblMin;

@property (weak, nonatomic) IBOutlet UILabel *lblMax;


@end
