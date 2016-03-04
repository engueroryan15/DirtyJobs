//
//  AccountViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "AccountViewController.h"

#import "UIManager.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width / 2;
    self.imgProfile.layer.borderWidth = 1.0f;
    self.imgProfile.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imgProfile.clipsToBounds = YES;
    
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

#pragma mark Side Menu Delegate;

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}



- (IBAction)btnMenu:(id)sender {
    
    [[UIManager sharedItems] openSideBar];
}
@end
