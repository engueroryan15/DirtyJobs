//
//  AccountViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "ViewController.h"

#import "ICSDrawerController.h"

@interface AccountViewController : ViewController <ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (weak, nonatomic) ICSDrawerController *drawer;

@property (weak, nonatomic) IBOutlet UIImageView *imgProfile;

- (IBAction)btnMenu:(id)sender;

@end
