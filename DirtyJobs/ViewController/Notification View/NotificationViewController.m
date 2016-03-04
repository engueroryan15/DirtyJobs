//
//  NotificationViewController.m
//  DirtyJobs
//
//  Created by Tapdash iOS Dev on 2/4/16.
//  Copyright © 2016 Tapdash iOS Dev. All rights reserved.
//

#import "NotificationViewController.h"

#import "NotificationTableViewCell.h"

#import "UIManager.h"

#import "CongBidViewController.h"

#import "SorryBidViewController.h"

@interface NotificationViewController (){
    
    NSMutableArray *arr;
    NSMutableArray *conArr;
    NSDictionary *dictInside;
    NSDictionary *dictTest;
    NSMutableArray *tArr;
    
}

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.tblView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
    
    
    self.tblView.sectionHeaderHeight = 0.0;
    self.tblView.sectionFooterHeight = 0.0;
    
    NSString *congratsStr = @"Congratulations JO 0000144 is now accepted by Laundry Jobs";
    
    NSString *sorryStr = @"Sorry to inform that your JO 0000134 has not been won yet";
    
    
    
    
    
//    _notificationDic = @{@"TODAY" : @[congratsStr],
//                         @"YESTERDAY" : @[sorryStr, congratsStr],
//                         @"MORE THAN 3 DAYS" : @[sorryStr, congratsStr,sorryStr, congratsStr]
//                         };
//    
//    _notifArr = [[_notificationDic allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
//    
//    _testArr = [NSArray arrayWithObjects:@"Dec 01 2013",@"Dec 02 2013",@"Dec 03 2013", nil];
    
    
    //Test Array
    
    
    arr = [[NSMutableArray alloc] init];
    
    tArr = [[NSMutableArray alloc] init];
    
    conArr = [NSMutableArray arrayWithObjects:sorryStr, congratsStr, nil];
    
    
    dictInside = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Dec 1 2013",@"Date",
                                conArr, @"Data Notif",
                                @"Success", @"status",
                                nil];
    
    
    dictTest = [NSDictionary dictionaryWithObjectsAndKeys:
                              dictInside, @"Notification Content" ,
                              nil];
    
    [arr addObject:dictTest];
    
    
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    NSLog(@"Count 1 = %i", [arr count]);
    
    return [arr count]; //[[arr objectAtIndex:0] count];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    NSArray *sectionAnimals = [[dictTest objectForKey:@"Notification Content"] objectForKey:@"Data Notif"];
    
    NSLog(@"Count 2 = %i", [sectionAnimals count]);
    
    
    return [sectionAnimals count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[arr objectAtIndex:section] objectForKey:@"Notification Content"] objectForKey:@"Date"]; //[arr objectAtIndex:section];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"Cell";
    
    NotificationTableViewCell *cell = (NotificationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NotificationTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSArray *sectionAnimals = [[dictTest objectForKey:@"Notification Content"] objectForKey:@"Data Notif"];
    
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    
    [cell.textFContent setText:animal];
    
    
    return cell;

}


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Background color
    view.tintColor = [UIColor colorWithRed:247/255.0 green:148/255.0 blue:41/255.0 alpha:1.0];
    
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor whiteColor]];
    
    // Another way to set the background color
    // Note: does not preserve gradient effect of original header
     header.contentView.backgroundColor = [UIColor colorWithRed:247/255.0 green:148/255.0 blue:41/255.0 alpha:1.0];
}



-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *sectionAnimals = [[dictTest objectForKey:@"Notification Content"] objectForKey:@"Data Notif"];
    
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    

    if ([animal rangeOfString:@"Sorry"].location == NSNotFound) {
        NSLog(@"string does not contain bla");
        
        [UIManager sharedItems].congBidView = [[CongBidViewController alloc] initWithNibName:@"CongBidViewController" bundle:nil];
        
        NSArray *arrData = [[NSArray alloc] initWithObjects:animal, nil];
        
        self.delegate = [UIManager sharedItems].congBidView;
        
        [self.delegate getData:arrData];
        
        [self.navigationController pushViewController:[[UIManager sharedItems] congBidView] animated:YES];
        
    
    } else {
    
        
        NSLog(@"string contains bla!");
        
        [UIManager sharedItems].sorryBidView = [[SorryBidViewController alloc] initWithNibName:@"SorryBidViewController" bundle:nil];
        
        NSArray *arrData = [[NSArray alloc] initWithObjects:animal, nil];
        
        self.delegate = [UIManager sharedItems].sorryBidView;
        
        [self.delegate getData:arrData];
        
        [self.navigationController pushViewController:[[UIManager sharedItems] sorryBidView] animated:YES];
        
    
    }
    
    
}

#pragma mark Menu Delegate;

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
