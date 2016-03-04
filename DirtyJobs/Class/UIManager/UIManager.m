//
//  UIManager.m
//  ULTEsco
//
//  Created by Nico Villanueva iOS Dev on 6/4/15.
//  Copyright (c) 2015 Tapdashheuristics. All rights reserved.
//

#import "UIManager.h"

#import "LoginViewController.h"

#import "RegistrationViewController.h"

#import "HomeViewController.h"

#import "NavigationViewController.h"

#import "BiddingViewController.h"

#import "BiddingDetailViewController.h"

#import "OrderSummaryViewController.h"

#import "TermsViewController.h"

#import "NotificationViewController.h"

#import "CongBidViewController.h"

#import "SorryBidViewController.h"

#import "PaymentViewController.h"

#import "ProfileViewController.h"

#import "AboutUsViewController.h"

#import "AccountViewController.h"

static UIManager *sharedItem = nil;

@implementation UIManager


-(UINavigationController *)loginViewCon{
    
    
    self.loginView = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:self.loginView];
    
    return navBar;
    
    
}


-(UIViewController *)registrationViewCon{
    
    
    self.registerView = [[RegistrationViewController alloc] initWithNibName:@"RegistrationViewController" bundle:nil];
    
    
    return self.registerView;
    
}


- (UIViewController*)homeViewCon{
    
    
    self.homeView = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    return self.homeView;
    
}

- (UIViewController *)navigationViewCon{
    
    self.navigationView = [[NavigationViewController alloc] initWithNibName:@"NavigationViewController" bundle:nil];
    
    return self.navigationView;
    
}

- (UIViewController*)biddingViewCon{
    
    
    self.biddingView = [[BiddingViewController alloc] initWithNibName:@"BiddingViewController" bundle:nil];
    
    return self.biddingView;
    
}


- (UIViewController*)orderSummaryViewCon{
    
    self.orderSummaryView = [[OrderSummaryViewController alloc] initWithNibName:@"OrderSummaryViewController" bundle:nil];
    
    
    return self.orderSummaryView;
    
}



- (UIViewController*)biddingDetailViewCon{
    
    self.biddingDetailView = [[BiddingDetailViewController alloc] initWithNibName:@"BiddingDetailViewController" bundle:nil];
    
    return self.biddingDetailView;
    
}

-(UIViewController *)termsViewCon{
    
    
    self.termsView = [[TermsViewController alloc] initWithNibName:@"TermsViewController" bundle:nil];
    
    return self.termsView;
    
}

- (UIViewController*)notificationViewCon{
    
    self.notificationView = [[NotificationViewController alloc] initWithNibName:@"NotificationViewController" bundle:nil];
    
    return self.notificationView;
    
}


- (UIViewController*)congBidViewCon{
    
    self.congBidView = [[CongBidViewController alloc] initWithNibName:@"CongBidViewController" bundle:nil];
    
    return self.congBidView;
    
}

- (UIViewController*)sorryBidViewCon{
    
    self.sorryBidView = [[SorryBidViewController alloc] initWithNibName:@"SorryBidViewController" bundle:nil];
    
    return self.sorryBidView;
    
}

-(UIViewController *)paymentViewCon{
    
    self.paymentView = [[PaymentViewController alloc] initWithNibName:@"PaymentViewController" bundle:nil];
    
    return self.paymentView;
    
}


-(UIViewController *)profileViewCon{
    
    self.profileView = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    
    return  self.paymentView;
    
}

-(UIViewController *)aboutUsViewCon{
    
    self.aboutUsView = [[AboutUsViewController alloc] initWithNibName:@"AboutUsViewController" bundle:nil];
    
    return self.aboutUsView;
    
}


- (UIViewController*)accountViewCon{
    
    self.accountView = [[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:nil];
    
    return self.accountView;
    
}


#pragma Mark Sidebar;

- (ICSDrawerController *)generateSideController{
    
    self.homeView = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    self.navigationView = [[NavigationViewController alloc] initWithNibName:@"NavigationViewController" bundle:nil];
    
    self.notificationView = [[NotificationViewController alloc] initWithNibName:@"NotificationViewController" bundle:nil];
    
    self.profileView = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    
    self.aboutUsView = [[AboutUsViewController alloc] initWithNibName:@"AboutUsViewController" bundle:nil];
    
    self.accountView = [[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:nil];
    
    self.sideBar = [[ICSDrawerController alloc] initWithLeftViewController:self.navigationView
                                                      centerViewController:self.homeView];
    
    return self.sideBar;
    
}

-(void)openSideBar{
    
    [self.sideBar open];
    
}




#pragma mark - SingleTon

+ (UIManager *)sharedItems
{
    if (sharedItem == nil) {
        sharedItem = [[super allocWithZone:NULL]init];
    }
    return  sharedItem;
}
- (id)init{
    if ((self = [super init])) {
        
    }
    return self;
}
+ (id)allocWithZone:(NSZone *)zone{
    return  [self sharedItems];
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}

@end
