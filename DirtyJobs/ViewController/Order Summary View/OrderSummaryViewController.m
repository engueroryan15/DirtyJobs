//
//  OrderSummaryViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/4/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "OrderSummaryViewController.h"

#import "GlobalVariables.h"


@interface OrderSummaryViewController ()

@end

@implementation OrderSummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    GlobalVariables *gvar = [GlobalVariables sharedItems];
    
    
    UIAlertView *msgAlrt = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"Thank You for Trusting Dirty Jobs %@ is now sent to the service provider.", gvar.nameStr] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",@"CANCEL", nil];
    
    
    [msgAlrt show];
    
    self.lblPersonalInfo.text = [NSString stringWithFormat:@"Name: %@ \n Address: %@", gvar.nameStr, gvar.addressStr];

    self.lblTypeOfService.text = [NSString stringWithFormat:@"Type of Service: %@", gvar.typeOfServiceStr];
    self.lblTypeOfPayment.text = [NSString stringWithFormat:@"Type of Payment: %@", gvar.typeOfPaymentStr];
    self.lblPrice.text = [NSString stringWithFormat:@"Price: %@.00", gvar.budgetStr];;
    
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

- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
