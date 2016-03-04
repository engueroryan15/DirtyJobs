//
//  CongBidViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/5/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "CongBidViewController.h"

#import "UIManager.h"

@interface CongBidViewController (){
    
    NSString *contentStr;
}

@end

@implementation CongBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.lblContent.text = contentStr;
    
    
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

- (IBAction)btnPayment:(id)sender {
    
    [self.navigationController pushViewController:[[UIManager sharedItems] paymentViewCon] animated:YES];
    
}


#pragma mark Notification Delegate;


-(void)getData:(NSArray *)details{
    
    contentStr = [details objectAtIndex:0];

    NSLog(@"Content = %@", contentStr);
    
}

@end
