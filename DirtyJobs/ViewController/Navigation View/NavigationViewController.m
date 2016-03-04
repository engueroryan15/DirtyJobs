//
//  NavigationViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/2/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "NavigationViewController.h"

#import "NavigationViewTableViewCell.h"

#import "UIManager.h"

#import "HomeViewController.h"

#import "ProfileViewController.h"

#import "NotificationViewController.h"

#import "AboutUsViewController.h"

#import "AccountViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _arrLabel = [NSArray arrayWithObjects:
                 @"DIRTY JOBS",
                 @"PROFILE",
                 @"NOTIFICATIONS",
                 @"ABOUT US",
                 @"CONTACT US",
                 @"ACCOUNT", nil];
    
    
    _arrImages = [NSArray arrayWithObjects:
                 @"dirtyJobsIcon.png",
                 @"profileIcon.png",
                 @"notificationIcon.png",
                 @"aboutUsIcon.png",
                 @"contactUsIcon.png",
                 @"accountIcon.png", nil];
    
    [self.tblMenu setBackgroundColor:[UIColor clearColor]];
    
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

#pragma Mark TableView Delegate;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_arrLabel count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    
    static NSString *cellIdentifier = @"Cell";
    
    NavigationViewTableViewCell *cell = (NavigationViewTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NavigationViewTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [cell.lblMenu setText:[_arrLabel objectAtIndex:indexPath.row]];
    
    cell.imgIcon.image = [UIImage imageNamed:[_arrImages objectAtIndex:indexPath.row]];
    

    
    return cell;
}

- (void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell setBackgroundColor:[UIColor clearColor]];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            
            [self.drawer replaceCenterViewControllerWithViewController:[[UIManager sharedItems] homeView]];
            
            
            break;
            
            
        case 1:
            
            [self.drawer replaceCenterViewControllerWithViewController:[[UIManager sharedItems] profileView]];
            
            
            break;
            
        case 2:
            
            [self.drawer replaceCenterViewControllerWithViewController:[[UIManager sharedItems] notificationView]];
            
            
            break;
            
        case 3:
            
            
            [self.drawer replaceCenterViewControllerWithViewController:[[UIManager sharedItems] aboutUsView]];
            
            break;
            
        case 4:
            
            
            
            
            break;
            
            
        case 5:
            
            [self.drawer replaceCenterViewControllerWithViewController:[[UIManager sharedItems] accountView]];
            
            
            break;
        
        default:
            break;
    }
    
}



@end
