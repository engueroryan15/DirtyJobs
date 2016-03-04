//
//  SorryBidViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/5/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "SorryBidViewController.h"

@interface SorryBidViewController (){
    
    NSString *sorryContent;
    
}

@end

@implementation SorryBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.lblSorry.text = sorryContent;
    
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


#pragma Mark Notification Delegate;


-(void)getData:(NSArray *)details{
    
    sorryContent = [details objectAtIndex:0];
    
    
}

@end
