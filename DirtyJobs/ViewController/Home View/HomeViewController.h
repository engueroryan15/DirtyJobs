//
//  HomeViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/2/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICSDrawerController.h"

@interface HomeViewController : UIViewController <ICSDrawerControllerChild, ICSDrawerControllerPresenting>


@property (weak, nonatomic) ICSDrawerController *drawer;

- (IBAction)btnBidNow:(id)sender;


- (IBAction)btnMenu:(id)sender;


- (IBAction)btnTerms:(id)sender;



@end
