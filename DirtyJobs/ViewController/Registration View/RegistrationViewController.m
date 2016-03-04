//
//  RegistrationViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/1/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "RegistrationViewController.h"

#import "GlobalVariables.h"

#import "PostClass.h"

#import "Json.h"

#import "constant.h"

@interface RegistrationViewController (){
    
    NSString *textIndex;
    
    NSDictionary *jsonRegister;
    
}

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self.scroller setScrollEnabled:YES];
//    [self.scroller setUserInteractionEnabled:YES];
    [self.scroller setScrollEnabled:YES];
    [self.scroller setContentSize:CGSizeMake(self.scroller.frame.origin.x, 613)];
    
    self.imgPicture.layer.cornerRadius = self.imgPicture.frame.size.width / 2;
    self.imgPicture.layer.borderWidth = 1.0f;
    self.imgPicture.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imgPicture.clipsToBounds = YES;
    
    
    _arrGender = [NSArray arrayWithObjects:@"Male",@"Female", nil];
    
    _arrStatus = [NSArray arrayWithObjects:@"Single",@"Married", nil];
    
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(doneClicked:)];
    
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    
    self.txtAge.inputAccessoryView = keyboardDoneButtonView;
    
    self.txtContact.inputAccessoryView = keyboardDoneButtonView;
    
    [self.bdayPicker setValue:[UIColor whiteColor] forKey:@"textColor"];
    
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
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)btnCancelPicker:(id)sender {
    
    [self.txtGender resignFirstResponder];
    
    [self scrollerAnimationClose];
    
}

- (IBAction)btnDonePicker:(id)sender {
    
    NSInteger row;
    
    row = [self.pickerViewNorm selectedRowInComponent:0];
    
    self.txtGender.text = [_arrGender objectAtIndex:row];
    
    
    [self.txtGender resignFirstResponder];
    
    [self scrollerAnimationClose];
    
    
}

- (IBAction)btnRegister:(id)sender {
    
    //[self.txtUserName.text isEqualToString:@""] ||
    
    if ([self.txtEmail.text isEqualToString:@""] || [self.txtPassword.text isEqualToString:@""] ||
        [self.txtConfirmPassword.text isEqualToString:@""] || [self.txtName.text isEqualToString:@""] || [self.txtGender.text isEqualToString:@""] ||
        [self.txtStatus.text isEqualToString:@""] || [self.txtAge.text isEqualToString:@""] || [self.txtBirthday.text isEqualToString:@""] ||
        [self.txtAddress.text isEqualToString:@""] || [self.txtContact.text isEqualToString:@""]) {
        
        
        UIAlertView *errAlert = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Please fill up all the required field" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [errAlert show];
        
    }else{
        
        NSDictionary *dictData = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"user-registration", @"Request‐Type",//
                                  self.txtEmail.text, @"Email",//
                                  self.txtPassword.text, @"Password",//
                                  self.txtName.text, @"fname",//
                                  self.txtLname.text, @"lname",//
                                  self.txtGender.text, @"gender",
                                  self.txtStatus.text, @"status",//
                                  self.txtAge.text, @"age",
                                  self.txtBirthday.text, @"bday",
                                  self.txtAddress.text, @"address",
                                  self.txtContact.text, @"cnumber",
                                  nil];
        
   
        
        _receivedDataPost = [NSMutableData data];
        
        NSURLRequest *request = [[PostClass sharedItems] postDataWithParams:dictData andURL:apiUrl];
        
        _theConnectionPost = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
    }
    
    

    
    
    GlobalVariables *gvar = [GlobalVariables sharedItems];
    
    gvar.userNameStr = self.txtUserName.text;
    
    gvar.emailStr = self.txtEmail.text;
    
    gvar.passwordStr = self.txtPassword.text;
    
    gvar.nameStr = self.txtName.text;
    
    gvar.genderStr = self.txtGender.text;
    
    gvar.statusStr = self.txtStatus.text;
    
    gvar.ageStr = self.txtAddress.text;
    
    gvar.birthdayStr = self.txtBirthday.text;
    
    gvar.addressStr = self.txtAddress.text;
    
    gvar.contactStr = self.txtContact.text;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)btnCancelStatus:(id)sender {
    
    [self.txtStatus resignFirstResponder];
    
    [self scrollerAnimationClose];
}

- (IBAction)btnDoneStatus:(id)sender {
    
    NSInteger row;
    
    row = [self.pickerViewStatus selectedRowInComponent:0];
    
    self.txtStatus.text = [_arrStatus objectAtIndex:row];
    
    [self scrollerAnimationClose];
    
    [self.txtStatus resignFirstResponder];
    
}

- (IBAction)btnCancelBday:(id)sender {
    
    [self.txtBirthday resignFirstResponder];
    
    [self scrollerAnimationClose];
    
}

- (IBAction)btnDoneBday:(id)sender {
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = self.bdayPicker.date;
    
    self.txtBirthday.text = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:date]];
    
    [self.txtBirthday resignFirstResponder];
    
    [self scrollerAnimationClose];
    
}

- (IBAction)btnUploadPhoto:(id)sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    
    
    
    
    if((UIButton *) sender == self.btnUploadProp) {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        [picker setAllowsEditing:YES];
        
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    
    [self presentViewController:picker animated:YES completion:nil];
    
}



#pragma Mark UIImagePicker Delegate;

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //[picker dismissModalViewControllerAnimated:YES];
    
    //self.scroller.contentOffset = CGPointMake(0, 0);
    
    UIImage *pickedImageEdited = [info objectForKey:UIImagePickerControllerEditedImage];
    
    self.imgPicture.image = pickedImageEdited;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"Image Loaded = %@", self.imgPicture.image);
    
}







#pragma Mark TextField Delegate;

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.scroller setUserInteractionEnabled:YES];
    
    [textField resignFirstResponder];
    
    if (self.view.frame.size.height == 568) {
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 0);
                             
                         }
                         completion:nil
         ];
    }else{
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 180);
                         }
                         completion:nil
         ];
    }
    
    return YES;
    
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    if (textField.tag == 0) {
        
        [self scrollerAnimation:75];
        
        return YES;
        
        
    }else if (textField.tag == 1) {
        
        [self scrollerAnimation:75];
        
        return YES;
        
        
    }else if (textField.tag == 2) {
        
        if ([self.txtEmail.text isEqualToString:@""]) {
            
            UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please fill the required field" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alrt show];
            
        }else{
            
            NSString *emailString = self.txtEmail.text;
            NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailReg];
            if (([emailTest evaluateWithObject:emailString] != YES) || [emailString isEqualToString:@""])
            {
                
                NSLog(@"Incorrect Format");
                
                UIAlertView *alertEmptyField = [[UIAlertView alloc] initWithTitle:@"Invalid Format" message:@"Please insert valid Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                
                [alertEmptyField show];
                
                self.txtEmail.text = @"";
                
            }else{
                
                NSLog(@"Correct Format");
                
            }
        }
        
        [self scrollerAnimation:75];
        
        return YES;
        
        
    }else if (textField.tag == 3) {
        
        
        [self scrollerAnimation:75];
        
        
    }else if (textField.tag == 4) {
     
        
        if ([self.txtPassword.text isEqualToString:self.txtConfirmPassword.text]) {
            
            NSLog(@"Password Matched");
            
        }else{
            
            UIAlertView *errComparePass = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Password Mismatched" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [errComparePass show];
            
        }
        
        [self scrollerAnimation:330];
        
        
    }else if (textField.tag == 5) {
        
        textIndex = @"5";
        
        [self scrollerAnimation:330];
        
        [textField setInputView:self.viewPicker];
        
        [self.pickerViewNorm reloadAllComponents];
        
        
    }else if (textField.tag == 6){
        
        textIndex = @"6";
        
        [self scrollerAnimation:330];
        
        [textField setInputView:self.viewPickerStatus];
        
        [self.pickerViewStatus reloadAllComponents];
    
    }else if (textField.tag == 7){
        
        [self scrollerAnimation:330];
    
        return YES;
    
    }else if (textField.tag == 8){
        
        
        [self scrollerAnimation:330];
        
        [textField setInputView:self.viewPickerBirth];
        
        return YES;
        
    }else if (textField.tag == 9){
        
        
        [self scrollerAnimation:330];
        
        return YES;
        
    }else if (textField.tag == 10){
        
        
        [self scrollerAnimation:335];
        
        return YES;
        
    }

    return YES;
    
    
}


#pragma Mark PickerView Delegate;

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title; // =
    
    if ([textIndex isEqualToString:@"5"]) {
        
        title =  _arrGender[row];
        
    }else if ([textIndex isEqualToString:@"6"]){
        
        title =  _arrStatus	[row];
        
    }
    
    
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if ([textIndex isEqualToString:@"5"]) {
        
        return _arrGender.count;
    
    }else if ([textIndex isEqualToString:@"6"]){
        
        return _arrStatus.count;
    }
    
    return 0;
    
    

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if ([textIndex isEqualToString:@"5"]) {
        
        return _arrGender[row];
        
    }else if ([textIndex isEqualToString:@"6"]){
        
        return _arrStatus[row];
    }
    
    
    return nil;

}


#pragma Mark Additional Class;

- (void) scrollerAnimation{
    
    if (self.view.frame.size.height == 568) {
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 170);
                             //[self.txtRegion setInputView:self.viewRegion];
                             
                         }
                         completion:nil
         ];
    }else{
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 180);
                             //[self.txtRegion setInputView:self.viewRegion];
                         }
                         completion:nil
         ];
    }
    
}



- (void) scrollerAnimation:(CGFloat)value{
    
    
    [self.scroller setUserInteractionEnabled:NO];
    
    if (self.view.frame.size.height == 568) {
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, value);
                             //[self.txtRegion setInputView:self.viewRegion];
                             
                         }
                         completion:nil
         ];
    }else{
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 180);
                             //[self.txtRegion setInputView:self.viewRegion];
                         }
                         completion:nil
         ];
    }
    
}




- (IBAction)doneClicked:(id)sender
{
    NSLog(@"Done Clicked.");
    
    [self.scroller setUserInteractionEnabled:YES];
    
    if (self.view.frame.size.height == 568) {
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 0);
                             
                         }
                         completion:nil
         ];
    }else{
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 180);
                         }
                         completion:nil
         ];
    }
    
    [self.txtAge resignFirstResponder];
    [self.txtContact resignFirstResponder];
    
}


- (void) scrollerAnimationClose{
    
    [self.scroller setUserInteractionEnabled:YES];
    
    if (self.view.frame.size.height == 568) {
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 0);
                             
                         }
                         completion:nil
         ];
    }else{
        
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.scroller.contentOffset = CGPointMake(0, 180);
                         }
                         completion:nil
         ];
    }
}



#pragma mark - URL Connection Delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    if (connection == self.theConnectionPost){
        
        [_receivedDataPost setLength:0];
        
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //NSLog(@"Error data = %@", error);
    
    [error localizedDescription];
    
    UIAlertView *noConnection = [[UIAlertView alloc]initWithTitle:@"Network Problem" message:@"Please Check Your Internet Connection" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [noConnection show];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    
    if (connection == self.theConnectionPost){
        
        [_receivedDataPost appendData:data];
        
    }
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    if (connection == self.theConnectionPost){
        
        if (!(_receivedDataPost == nil)) {
            
            
            jsonRegister = [Json jsonParser:_receivedDataPost];
            
            
            NSLog(@"Submit = %@", jsonRegister);
            
        }
        
        NSLog(@"Finish");
        
        
    }
    
}


@end
