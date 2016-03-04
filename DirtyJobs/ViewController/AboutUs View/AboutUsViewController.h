//
//  AboutUsViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "ViewController.h"

#import "ICSDrawerController.h"

@interface AboutUsViewController : ViewController <ICSDrawerControllerPresenting, ICSDrawerControllerChild>


@property (weak, nonatomic) ICSDrawerController *drawer;

- (IBAction)btnMenu:(id)sender;

@end
