//
//  ShopDetailsViewController.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 15/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ShopDetailsViewController.h"

#define kCollectionCellHieght 140
#define kCollectionCellWidth  180

@interface ShopDetailsViewController ()

@end

@implementation ShopDetailsViewController
{
	NSArray *items;
}

#pragma mark - Initial VC SetUp
- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setUpVC];
	
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

-(void) setUpVC
{
	[self setUpCollectionView];
	[self setUpSearchButton];
	
}
//sets up Collection View
-(void) setUpCollectionView
{
	self.itemCollectionView.delegate=self;
	self.itemCollectionView.dataSource=self;
	[self.itemCollectionView registerNib:[UINib nibWithNibName:kshopItemCollectionXIBNamed bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kShopItemCollectionCellIdentifier];
}

-(void) setUpSearchButton
{
	[UIButton setUpSearchButton:self.searchButton];
}


#pragma mark - Collection View Delegates

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 10;//to be done
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return kNoOfSectionsInCollectionView;
}

-(UICollectionViewCell *)collectionView :(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
	ShopItemCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kShopItemCollectionCellIdentifier forIndexPath:indexPath];
	// to be done
    cell.itemImage.image=[UIImage imageNamed:@"BlueShirt.jpg"];
    cell.itemNameLabel.text = @"Blue Shirt";
    cell.itempriceLabel.text = @"Rs.1000";
	return cell;
}


#pragma mark- Collection View Cell Layout methods
-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return CGSizeMake(kCollectionCellWidth, kCollectionCellHieght);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
	return UIEdgeInsetsMake(kConstIntZero,kConstIntZero,kConstIntZero,kConstIntZero);
}


@end
