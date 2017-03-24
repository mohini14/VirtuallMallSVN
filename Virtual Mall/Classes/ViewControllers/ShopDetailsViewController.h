//
//  ShopDetailsViewController.h
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 15/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Define.h"
#import "ShopItemCollectionCell.h"
#import "UIButton+VirtualMall.h"

#define kShopItemCollectionCellIdentifier @"ShopItem"
#define kshopItemCollectionXIBNamed @"ShopItemCollectionCell"
#define kShopItemCollectionXIBClass @"ShopItemCollectionCell"

@interface ShopDetailsViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UICollectionView *itemCollectionView;

@end
