//
//  UserHomePageMenuVC.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 16/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "SWRevealViewController.h"
#import "UserHomePageMenuVC.h"

@interface UserHomePageMenuVC () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _userMenuItemList;
}
@end

#define kHomeSlideBarCellIdentifiers @"homeMenuCell"
#define kHomeMenuToHomeVCIdentifiers @"HomeMenuToHomeVC"
#define kMyAccountMenuToMyAccountVCIdentifiers @"MyAccountMenuToMyAccountVC"
#define kMyShopsMenuToMyShopsIdentifiers @"MyShopsMenuToMyShopsVC"
#define kHomeMenu @"Home"
#define kMyAccountMenu @"MyAccount"
#define kMyShopsMenu @"MyShops"
#define kOrdersMenu @"Orders"
#define kLogoutMenu @"Logout"
#define kZeroPointFive 0.5

@implementation UserHomePageMenuVC

#pragma mark - life cycle method

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpVCAppearance];
    _userMenuItemList = @[@"Home",@"MyAccount",@"MyShops",@"Orders",@"Logout"];
}
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private method

- (void) setUpVCAppearance
{
    [self setUserImageAppearance];
    self.userMenuTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (void) setUserImageAppearance
{
    self.userImageView.layer.cornerRadius = self.userImageView.layer.bounds.size.height * kZeroPointFive;
}
//This method will show confirmation alert for logout
- (void) promptLogoutUserMessage
{
    __weak typeof(UserHomePageMenuVC)*weakSelf = self;
    UIAlertController* logoutAlert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"AppName", nil)
                                                                message:NSLocalizedString(@"Logout Warning Message" , nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction actionWithTitle:NSLocalizedString(@"YES", nil)
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action){
        [weakSelf removeUserData];
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction* noButton = [UIAlertAction actionWithTitle:NSLocalizedString(@"NO", nil)
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf.revealViewController revealToggleAnimated:YES];
    }];
    [logoutAlert addAction:yesButton];
    [logoutAlert addAction:noButton];
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf presentViewController:logoutAlert animated:YES completion:nil];
    });
}

//this method will erase user data
- (void) removeUserData
{
    
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _userMenuItemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeSlideBarCellIdentifiers
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [_userMenuItemList objectAtIndex:indexPath.row];
    return cell;
}

#pragma - mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* selectedMenu = [_userMenuItemList objectAtIndex:indexPath.row];
    if([selectedMenu isEqualToString:kHomeMenu])
        [self performSegueWithIdentifier:kHomeMenuToHomeVCIdentifiers sender:nil];
    else if([selectedMenu isEqualToString:kMyAccountMenu])
        [self performSegueWithIdentifier:kMyAccountMenuToMyAccountVCIdentifiers sender:nil];
    else if([selectedMenu isEqualToString:kMyShopsMenu])
        [self performSegueWithIdentifier:kMyShopsMenuToMyShopsIdentifiers sender:nil];
    else if([selectedMenu isEqualToString:kLogoutMenu])
        [self promptLogoutUserMessage];
}

#pragma - mark navigation

@end
