//
//  ProfileViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "ViewController.h"

#import "ICSDrawerController.h"



@interface ProfileViewController : ViewController <UITableViewDataSource, UITableViewDelegate, ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UILabel *lblDetailsUser;

@property (weak, nonatomic) ICSDrawerController *drawer;

@property (weak, nonatomic) IBOutlet UIImageView *imgProfilePic;

- (IBAction)btnMenu:(id)sender;




//Sample Data;


@property (strong, nonatomic) NSMutableArray *sampleArr;

@property (strong, nonatomic) NSDictionary *sampleDict;




@end
