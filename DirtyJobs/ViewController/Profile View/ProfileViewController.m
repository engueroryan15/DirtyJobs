//
//  ProfileViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/10/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "ProfileViewController.h"

#import "ProfileTableViewCell.h"

#import "GlobalVariables.h"

#import "UIManager.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imgProfilePic.layer.cornerRadius = self.imgProfilePic.frame.size.width / 2;
    self.imgProfilePic.layer.borderWidth = 1.0f;
    self.imgProfilePic.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imgProfilePic.clipsToBounds = YES;
    
    _sampleArr = [[NSMutableArray alloc] init];
    
    
    _sampleDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                   @"1200",@"Price",
                   @"Car And Automotive",@"Transaction",
                   @"12/11/16",@"Date",
                   @"000005",@"JO_Number",
                   nil];
    
    
    [_sampleArr addObject:_sampleDict];
    
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
    return [_sampleArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    
    static NSString *cellIdentifier = @"Cell";
    
    ProfileTableViewCell *cell = (ProfileTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProfileTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.lblDate.text = [[_sampleArr objectAtIndex:indexPath.row] objectForKey:@"Date"];
    cell.lblAmount.text = [NSString stringWithFormat:@"PHP %@", [[_sampleArr objectAtIndex:indexPath.row] objectForKey:@"Price"]];
    cell.lblJONumber.text = [NSString stringWithFormat:@"JO NO.: %@", [[_sampleArr objectAtIndex:indexPath.row] objectForKey:@"JO_Number"]];
    cell.lblService.text = [[_sampleArr objectAtIndex:indexPath.row] objectForKey:@"Transaction"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
}


#pragma mark Side Menu Delegate;

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}



- (IBAction)btnMenu:(id)sender {
    
    [[UIManager sharedItems] openSideBar];
}
@end
