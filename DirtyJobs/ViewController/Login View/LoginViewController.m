//
//  LoginViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/1/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "LoginViewController.h"

#import "UIManager.h"

#import "GlobalVariables.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationController.navigationBar setHidden:YES];
    
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

- (IBAction)btnLogin:(id)sender {
    
//    GlobalVariables *gvar = [GlobalVariables sharedItems];
//    
//    if ([self.txtUsername.text isEqualToString:gvar.userNameStr] || [self.txtPassword.text isEqualToString:gvar.passwordStr]) {
//        
//        
//        [self.navigationController pushViewController:[[UIManager sharedItems] generateSideController] animated:YES];
//        
//    }else{
//        
//        UIAlertView *errAlrt = [[UIAlertView alloc] initWithTitle:@"Failed to Login" message:@"Incorrect Username or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        
//        
//        [errAlrt show];
//        
//    }
    
    
    [self.navigationController pushViewController:[[UIManager sharedItems] generateSideController] animated:YES];
    
    
}

- (IBAction)registrationAction:(id)sender {
    
    [self.navigationController pushViewController:[[UIManager sharedItems] registrationViewCon] animated:YES];
    
}


#pragma Mark TextField Delegate;

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}


@end
