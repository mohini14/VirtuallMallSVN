//
//  HomePageViewController.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 10/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "SWRevealViewController.h"
#import "Shop.h"
#import "ShopTableViewCell.h"
#import "UIButton+VirtualMall.h"
#import "Utility.h"
#import "HomePageViewController.h"

#define kShopTableCellIdentifier @"shopTableCell"
#define kShopTableCellXIBName @"ShopTableViewCell"
#define kHomeToShopDetailsSegue @"HomeToShopDetails"
#define kShopTableCellHeight  200.0

@interface HomePageViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation HomePageViewController

#pragma mark - life cycle method
- (void) viewDidLoad
{
    [super viewDidLoad];
    [Utility setSliderBarButtonProperty:self];
    [self setButtonsAppearance];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private method

//This method method set UI of search button
- (void) setButtonsAppearance
{
    [UIButton setUpSearchButton:self.searchButton];
}

#pragma  mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kShopTableCellIdentifier];
    if(cell == nil)
     cell = [[[NSBundle mainBundle]loadNibNamed:kShopTableCellXIBName owner:nil options:nil] firstObject];
    NSDictionary* aShopDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Assotech One",@"shopName",@"Noida Sector 62",@"shopAddress",@"2",@"shopRating",@"DummyShopImage.jpg",@"shopImageName", nil];
    Shop* aShop = [[Shop alloc] initShopWithDictionary:aShopDict];
    [cell setValueInToTableCell:aShop];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kHomeToShopDetailsSegue sender:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kShopTableCellHeight;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:kHomeToShopDetailsSegue])
    {
        
    }
}


@end
