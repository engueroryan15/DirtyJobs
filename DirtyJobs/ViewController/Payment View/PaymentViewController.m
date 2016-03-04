//
//  PaymentViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "PaymentViewController.h"

#import "GlobalVariables.h"

#import "UIManager.h"

@interface PaymentViewController (){
    
    GlobalVariables *gvar;
    
}

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    gvar = [GlobalVariables sharedItems];
    
    
    self.lblPersonalDetail.text = [NSString stringWithFormat:@"Name: %@ \n Address: %@", gvar.nameStr, gvar.addressStr];
    
    self.lblInfoDetail.text = [NSString stringWithFormat:@"Type of Service: %@ \n Price: %@ \n Type of Payment: %@", gvar.typeOfServiceStr, gvar.budgetStr, gvar.typeOfPaymentStr];

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
