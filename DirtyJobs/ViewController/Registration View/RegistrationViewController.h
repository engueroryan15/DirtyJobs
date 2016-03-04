//
//  RegistrationViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/1/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate>


- (IBAction)btnBack:(id)sender;

- (IBAction)btnCancelPicker:(id)sender;

- (IBAction)btnDonePicker:(id)sender;



- (IBAction)btnRegister:(id)sender;

- (IBAction)btnCancelStatus:(id)sender;

- (IBAction)btnDoneStatus:(id)sender;


- (IBAction)btnCancelBday:(id)sender;

- (IBAction)btnDoneBday:(id)sender;

- (IBAction)btnUploadPhoto:(id)sender;


@property (strong, nonatomic) NSMutableData *receivedDataPost;

@property (strong, nonatomic) NSURLConnection *theConnectionPost;



@property (weak, nonatomic) IBOutlet UIButton *btnUploadProp;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewNorm;

@property (strong, nonatomic) IBOutlet UIView *viewPicker;

@property (strong, nonatomic) NSArray *arrGender;

@property (strong, nonatomic) NSArray *arrStatus;

@property (weak, nonatomic) IBOutlet UITextField *txtGender;

@property (strong, nonatomic) IBOutlet UIView *viewPickerStatus;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewStatus;

@property (weak, nonatomic) IBOutlet UIImageView *imgPicture;


@property (weak, nonatomic) IBOutlet UITextField *txtUserName;

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;


@property (weak, nonatomic) IBOutlet UITextField *txtStatus;

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtLname;

@property (weak, nonatomic) IBOutlet UITextField *txtAge;

@property (weak, nonatomic) IBOutlet UITextField *txtBirthday;

@property (weak, nonatomic) IBOutlet UITextField *txtAddress;

@property (weak, nonatomic) IBOutlet UITextField *txtContact;

@property (weak, nonatomic) IBOutlet UIScrollView *scroller;


@property (strong, nonatomic) IBOutlet UIView *viewPickerBirth;

@property (weak, nonatomic) IBOutlet UIDatePicker *bdayPicker;






@end
