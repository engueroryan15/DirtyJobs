//
//  BiddingDetailViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/3/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "BiddingDetailViewController.h"

#import "OrderSummaryViewController.h"

#import "GlobalVariables.h"

#import "UIManager.h"

@interface BiddingDetailViewController (){
    
    GlobalVariables *gvar;
    
}

@end

@implementation BiddingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    gvar = [GlobalVariables sharedItems];
    
    self.lblTitleNav.text = _titleStr;
    
    NSLog(@"Title = %@",_titleStr);
    
    [[UISlider appearance] setThumbImage:[UIImage imageNamed:@"thumbImage.png"] forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:[UIImage imageNamed:@"thumbImage.png"] forState:UIControlStateHighlighted];
    
    
    
    [self.pickerDate setValue:[UIColor whiteColor] forKey:@"textColor"];
    
    int convertedValue = (int) self.sliderAmout.value;
    
    self.lblMax.text = [NSString stringWithFormat:@"Php %i",convertedValue];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}	

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma Mark Textfield Delegate;


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [textField setInputView:self.viewDatePicker];
    
    
    return YES;
    
}


#pragma Mark Bidding View Delegate;

-(void)getData:(NSArray *)details{
    
    _titleStr = [details objectAtIndex:0];
    
    NSLog(@"Content = %@", _titleStr);
    
}


#pragma Mark Actions;


- (IBAction)btnBackButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)btnDone:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd/MM/YYYY HH:mm"];
    
    NSDate *date = self.pickerDate.date;
    
    self.txtDeadline.text = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:date]];
    
    [self.txtDeadline resignFirstResponder];
    
}

- (IBAction)btnCancel:(id)sender {
    
    [self.txtDeadline resignFirstResponder];
    
}

- (IBAction)silderAction:(id)sender {
    
    int i = (int) self.sliderAmout.value;
    
    self.lblMax.text = [NSString stringWithFormat:@"Php %i", i];
    
}




- (IBAction)btnCashActionCheck:(id)sender{
    
    
    gvar.typeOfPaymentStr = @"Cash";
    
    [self.btnCashCheck setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    
    [self.btnCreditCardCheck setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    
}

- (IBAction)btnCashActionUnCheck:(id)sender{
    
    gvar.typeOfPaymentStr = @"Credit Card";
    
}



- (IBAction)btnCreditCardActionCheck:(id)sender{
    
    gvar.typeOfPaymentStr = @"Credit Card";
    
    [self.btnCashCheck setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    
    [self.btnCreditCardCheck setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    
}

- (IBAction)btnCreditCardActionUnCheck:(id)sender{
    
    gvar.typeOfPaymentStr = @"Cash";
    
}

- (IBAction)btnPlanceBid:(id)sender {
    
    gvar.budgetStr = self.lblMax.text;
    
    gvar.typeOfServiceStr = _titleStr;
    
    [self.navigationController pushViewController:[[UIManager sharedItems] orderSummaryViewCon] animated:YES];
    
    
}


@end
