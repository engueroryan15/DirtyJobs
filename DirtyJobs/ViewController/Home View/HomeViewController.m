//
//  HomeViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/2/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "HomeViewController.h"

#import "UIManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
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


#pragma mark - ICSDrawerControllerPresenting

- (IBAction)btnBidNow:(id)sender {
    
    [self.navigationController pushViewController:[[UIManager sharedItems] biddingViewCon ] animated:YES];
    
}

- (IBAction)btnMenu:(id)sender {
    
    [[UIManager sharedItems] openSideBar];
    
}

- (IBAction)btnTerms:(id)sender {
    
    [self.navigationController pushViewController:[[UIManager sharedItems] termsViewCon] animated:YES];
    
}

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}



@end
