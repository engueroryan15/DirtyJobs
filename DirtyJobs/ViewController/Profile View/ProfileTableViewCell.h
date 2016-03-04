//
//  ProfileTableViewCell.h
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lblDate;

@property (weak, nonatomic) IBOutlet UILabel *lblService;

@property (weak, nonatomic) IBOutlet UILabel *lblJONumber;

@property (weak, nonatomic) IBOutlet UILabel *lblAmount;

@end
