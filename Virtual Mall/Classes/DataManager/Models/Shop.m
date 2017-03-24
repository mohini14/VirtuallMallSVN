//
//  Shop.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 15/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (instancetype) initShopWithDictionary:(NSDictionary*) shop
{
    self = [super init];
    if(self)
    {
        self.shopName = [shop objectForKey:@"shopName"];
        self.shopAddress = [shop objectForKey:@"shopAddress"];
        self.shopRating = [NSNumber numberWithInteger:[[shop objectForKey:@"shopRating"] integerValue]];
        self.shopImageName = [shop objectForKey:@"shopImageName"];
    }
    return  self;
}

@end
