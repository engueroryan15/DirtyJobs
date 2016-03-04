//
//  NavigationViewController.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/2/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICSDrawerController.h"


@interface NavigationViewController : UIViewController <ICSDrawerControllerChild, ICSDrawerControllerPresenting, UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) ICSDrawerController *drawer;

@property (strong, nonatomic) NSArray *arrLabel;

@property (strong, nonatomic) NSArray *arrImages;

@property (weak, nonatomic) IBOutlet UITableView *tblMenu;

@end
