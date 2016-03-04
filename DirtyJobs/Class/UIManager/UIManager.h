//
//  UIManager.h
//  ULTEsco
//
//  Created by Nico Villanueva iOS Dev on 6/4/15.
//  Copyright (c) 2015 Tapdashheuristics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginViewController.h"

#import "ICSDrawerController.h"

#import "AboutUsViewController.h"


@class LoginViewController;

@class RegistrationViewController;

@class HomeViewController;

@class NavigationViewController;

@class BiddingViewController;

@class BiddingDetailViewController;

@class OrderSummaryViewController;

@class TermsViewController;

@class NotificationViewController;

@class CongBidViewController;

@class SorryBidViewController;

@class PaymentViewController;

@class ProfileViewController;

@class AboutUsViewController;

@class AccountViewController;

@interface UIManager : NSObject

@property (strong, nonatomic) LoginViewController *loginView;

@property (strong, nonatomic) RegistrationViewController *registerView;

@property (strong, nonatomic) HomeViewController *homeView;

@property (strong, nonatomic) NavigationViewController *navigationView;

@property (strong, nonatomic) BiddingViewController *biddingView;

@property (strong, nonatomic) BiddingDetailViewController *biddingDetailView;

@property (strong, nonatomic) OrderSummaryViewController *orderSummaryView;

@property (strong, nonatomic) TermsViewController *termsView;

@property (strong, nonatomic) NotificationViewController *notificationView;

@property (strong, nonatomic) CongBidViewController *congBidView;

@property (strong, nonatomic) SorryBidViewController *sorryBidView;

@property (strong, nonatomic) PaymentViewController *paymentView;

@property (strong, nonatomic) ProfileViewController *profileView;

@property (strong, nonatomic) AboutUsViewController *aboutUsView;

@property (strong, nonatomic) AccountViewController *accountView;



@property (strong, nonatomic) ICSDrawerController *sideBar;




- (UINavigationController*)loginViewCon;

- (UIViewController*)registrationViewCon;

- (UIViewController*)homeViewCon;

- (UIViewController*)navigationViewCon;

- (UIViewController*)biddingViewCon;

- (UIViewController*)biddingDetailViewCon;

- (UIViewController*)orderSummaryViewCon;

- (UIViewController*)termsViewCon;

- (UIViewController*)notificationViewCon;

- (UIViewController*)congBidViewCon;

- (UIViewController*)sorryBidViewCon;

- (UIViewController*)paymentViewCon;

- (UIViewController*)profileViewCon;

- (UIViewController*)aboutUsViewCon;

- (UIViewController*)accountViewCon;


//- (UINavigationController*)menuScreenViewCon;

+ (UIManager *) sharedItems;


- (ICSDrawerController*) generateSideController;

- (void) openSideBar;

@end
