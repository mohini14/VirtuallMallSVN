//
//  ShopItem.h
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 15/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShopItem : NSObject

@property (strong,nonatomic) UIImage *itemImage;
@property (strong,nonatomic) NSString *itemname;
@property (strong,nonatomic) NSNumber *itemPrice;

@end
