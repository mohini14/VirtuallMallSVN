//
//  UIColor+VirtualMall.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 16/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "UIColor+VirtualMall.h"

#define kTextFieldRedColor 0.667
#define kTextFieldGreenColor 0.667
#define kTextFieldBlueColor 0.667
#define kTextFieldAlpha 1.0

@implementation UIColor (VirtualMall)

+(UIColor *) getTextFieldBorderColor
{
	return [UIColor colorWithRed:kTextFieldRedColor	green:kTextFieldGreenColor blue:kTextFieldBlueColor alpha:kTextFieldAlpha];
}

@end
