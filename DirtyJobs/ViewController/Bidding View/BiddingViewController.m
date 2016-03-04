//
//  BiddingViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/3/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "BiddingViewController.h"

#import "BiddingTableViewCell.h"

#import "UIManager.h"

#import "BiddingDetailViewController.h"

@interface BiddingViewController ()

@end

@implementation BiddingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _arrService = [NSArray arrayWithObjects:
                   @"PET 101",
                   @"CARS / AUTOMOTIVE",
                   @"LAUNDRY",
                   @"ELECTRICAL / REPAIR",
                   @"PHOTO AND VIDEO",
                   @"HOUSEHOLD NEEDS",
                   @"AQUARIUM DESIGNS", nil];
    
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
    return [_arrService count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    
    static NSString *cellIdentifier = @"Cell";
    
    BiddingTableViewCell *cell = (BiddingTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BiddingTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [cell.lblServices setText:[_arrService objectAtIndex:indexPath.row]];
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    [UIManager sharedItems].biddingDetailView = [[BiddingDetailViewController alloc] initWithNibName:@"BiddingDetailViewController" bundle:nil];
    
    
    NSArray *arrData = [[NSArray alloc] initWithObjects:[_arrService objectAtIndex:indexPath.row], nil];
    
    self.delegate = [UIManager sharedItems].biddingDetailView;
    
    [self.delegate getData:arrData];
    
    [self.navigationController pushViewController:[[UIManager sharedItems] biddingDetailView] animated:YES];
    
}



- (IBAction)btnBackHome:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
