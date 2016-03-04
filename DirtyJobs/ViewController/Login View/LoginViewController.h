//
//  LoginViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/1/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet UITextField *txtUsername;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;




- (IBAction)btnLogin:(id)sender;

- (IBAction)registrationAction:(id)sender;



@end
